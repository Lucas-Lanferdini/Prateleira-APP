import SwiftUI
import PlaygroundSupport
//import prateleira

// Sua classe ApiReq
let apiReq = ApiReq(ingrediente: ["arroz", "feijão"])

// Função assíncrona para chamar makeRequest
func testAsyncFunction() async {
    await apiReq.makeRequest()
    print(apiReq.response)
    print(apiReq.recipe ?? "Recipe not available")
}

// Executa a função assíncrona usando o `Task`
Task {
    await testAsyncFunction()
}

// Mantém o playground rodando para a execução assíncrona
PlaygroundPage.current.needsIndefiniteExecution = true

