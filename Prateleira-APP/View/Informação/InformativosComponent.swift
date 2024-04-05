//
//  InformativosComponent.swift
//  Prateleira-APP
//
//

import SwiftUI



struct InfoCom: Identifiable{
    var id = UUID()
    var image: String
    var title: String
    var link: String
}

struct InformativosComponent: View {
    var inf: InfoCom
    var body: some View {
        Button(action: {
            if let url = URL(string: inf.link) {
                UIApplication.shared.open(url)
            }
        }) {
            VStack{
                Image(inf.image)
                    .resizable()
                    .frame(width: 320, height: 150)

                Text(inf.title)
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .padding([.horizontal, .bottom], 10)
        
            }.frame(width: 320)
                .background(Color.cinza)
        }
    }
}

