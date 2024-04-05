import Foundation
import SwiftUI
import TipKit

let restrictions = ["Vegetarianismo", "Glútem", "Carne Vermelha", "Veganismo", "Lactose", "Frutos do Mar"]
let time = ["10 min", "20 min", "30 min", "40 min", "50 min", "1 hora"]





struct ParameterRuleTip: Tip {
    // Define the app state you want to track.
    @Parameter
    static var isLoggedIn: Bool = false
    
    var title: Text {
        Text("Conversões de medidas")
    }
    var message: Text? {
        Text("\nVolume:\n1 colher de sopa ≈ 15ml\n1 colher de chá ≈ 5ml\n1 xícara/copo americano ≈ 240ml\n\nPeso:\n1 xícara de farinha de trigo ≈ 120 g\n1 xícara de açúcar ≈ 200 g\n1 xícara de manteiga ≈ 225 g\n\nPeso e volume:\n1 grama (g) de líquido ≈ 1ml\n1 grama (g) de líquido ≈ 1ml\n1 colher sopa açúcar ≈ 12,5g\n1 colher sopa farinha de trigo ≈ 7,5g\n1 colher sopa manteiga ≈ 14g\n")

    }
    var image: Image? {
        Image(systemName: "")
    }
    var rules: [Rule] {
        [
            // Define a rule based on the app state.
            #Rule(Self.$isLoggedIn) {
                // Set the conditions for when the tip displays.
                $0 == true
            }
        ]
    }
}

struct headerView: View {
    @State var tip = ParameterRuleTip()
    
    var body: some View {
        VStack(alignment: .leading){
            ZStack{

                Image("header")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                
                VStack{
                    HStack{
                        Text("Prateleira")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                        Image(systemName: "refrigerator.fill")
                            .foregroundColor(.white)
                            .font(.title)
                        
                        Spacer()
                        
                        Button(action: {
                           ParameterRuleTip.isLoggedIn.toggle()

                            
                        }
                               , label: {
                            Image(systemName: "info.circle")
                                .font(.title)
                                .foregroundStyle(.white)   
                                .popoverTip(tip)
                    })
                        

                        
                    }
                    .padding()
                    .padding(.top, 30)
                    
                }.padding()
            }
            //            Image("linha")
            //                .resizable()
            //                .frame(width: 397.5, height: 32.94)
        }

    }
    //return body
}

#Preview {
    headerView()
}
