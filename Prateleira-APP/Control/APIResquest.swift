import Foundation
import OpenAIKit
import CoreData

struct RecipeReturn {
    var name: String
    var ingredients: [String]
    var instructions: String
}



class ApiReq: ObservableObject {
    @Published var recipe: RecipeReturn?
    var response: String = ""
    let OpenAI = OpenAIKit(apiToken: "", organization: "")
    var ingrediente:[String]

    func makeRequest(moc: NSManagedObjectContext) async -> String {
        
        do {
            print("Teste \(restricao)")
            let prompt = "Apresente uma receita curta que utilize alguns desses ingredientes: \(ingrediente) Nome da receita, ingredientes e modo de preparo sem apresentação, com essas restrições alimentares e esse tempo maximo: \(restricao), cite apenas o nome da receita no inicio e nada mais"
            print(ingrediente)
            let result = await OpenAI.sendChatCompletion(
                newMessage: AIMessage(role: .system, content: prompt),
                previousMessages: [],
                model: .gptV3_5(.gptTurbo),
                maxTokens: 500,
                n: 1
            )
            
            switch result {
            case .success(let aiResult):
                if let text = aiResult.choices.first?.message?.content {
                    
                    self.response = text
                    
                    print(text)
                    
                    let lines = response.components(separatedBy: "\n")
                    let palavraChave = "Ingredientes:"
                    
                    guard let ingredientIndex = lines.firstIndex(of: palavraChave) else {
                        print("Palavra-chave não encontrada.")
                        return response
                    }
                    
                    // Encontre o índice da linha anterior a "Modo de Preparo:"
//                    guard let instructionIndex = lines.firstIndex(of: "Modo de preparo:") else {
//                        print("Linha 'Modo de preparo:' não encontrada.")
//                        return response
//                    }
                    guard let instructionIndex = lines.firstIndex(where: { $0.lowercased().hasPrefix("modo de preparo:") }) else {
                                            print("Linha 'Modo de preparo:' não encontrada.")
                                            return response
                                        }
                    
                    // Extrai as linhas entre "Ingredientes:" e a linha anterior a "Modo de Preparo:"
                    let ingredientsLines = lines[(ingredientIndex + 1)..<instructionIndex]
                    
                    let ingredientsText = ingredientsLines.joined(separator: "\n")
                    print("Ingredientes:\n\(ingredientsText)")
                    
                    // Atribua os valores a `recipe` conforme necessário
                    let name = lines[0]
                    let ingredients = Array(ingredientsLines)
                    let instructions = lines[instructionIndex..<lines.count].joined(separator: "\n")
                    
                    DispatchQueue.main.async {
                        
                        self.recipe = RecipeReturn(name: name, ingredients: ingredients, instructions: instructions)
                        
                        
                        let newFood = Hist(context:  moc)
                        newFood.id = UUID()
                        newFood.nome = name
                        newFood.instrucao = instructions
                        newFood.receita = ingredients
                        newFood.data = Date.now
                        newFood.fav = false
                        newFood.ttl = Date.now.addingTimeInterval(30 * 24 * 60 * 60)
                        try? moc.save()
                    }
                }
            case .failure(let error):
                self.response = "Error: \(error.localizedDescription)"
            }
        }
        return response
    }
    
    init(ingrediente: [String]) {
        self.ingrediente = ingrediente
    }
}
