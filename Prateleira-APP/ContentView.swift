import SwiftUI
import TipKit

struct ContentView: View {
    //    @State var showTutorial = UserDefaults.standard.bool(forKey: "tutorial")
    @AppStorage("tutorial", store: .standard) var showTutorial: Bool = true
    
    
    var body: some View {
        
        if showTutorial {
            AnyView(TelaUmPrateleira())
        } else {
            
            
            TabView{
                NavigationStack {
                    MinhaPrateleiraView()
                }
                
                .tabItem {
                    Label("Minha Despensa", systemImage: "fork.knife")
                }
                
                
                HistComponent()
                    .tabItem {
                        Label("Histórico", systemImage: "clock.arrow.circlepath")
                    }
                    .ignoresSafeArea()
                //                InfoView()
                //                    .tabItem {
                //                        Label("Informação", systemImage: "newspaper.fill")
                //                    }
            }
            .tint(.corFundo)
        }
    }
}

#Preview {
    ContentView()
}
