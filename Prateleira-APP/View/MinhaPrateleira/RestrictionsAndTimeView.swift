import Foundation
import SwiftUI

struct RestrictionAndTimeButtonsView: View {

    let buttons: [String]
    @State var count: Int = 3
    var body: some View {
        VStack{
            HStack {
                ForEach(0..<buttons.count, id: \.self) { i in
                    if (i < count) {
                        ButtonView(button: buttons[i])
                    }
                }
            }
            HStack {
                ForEach(3..<buttons.count, id: \.self) { i in
                    if (i >= count) {
                        ButtonView(button: buttons[i])
                    }
                }
            }
        }
    }
}
var restricao: [String] = [""]

    struct ButtonView: View {
        var button: String
        @State var isPressed: Bool = false

        var body: some View {
            Button(action: {
                print("Button action")
                // count += 1
                isPressed.toggle()
                if isPressed == true {
                    restricao.append(button)
                }
                if isPressed == false{
                    if let index = restricao.firstIndex(of: button) {
                        restricao.remove(at: index)
                    }                }
                print(restricao)
            }) {
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16.0)
                            .fill(isPressed ? .lightYellow : .white)
                            .stroke(isPressed ? Color.white : Color.black, lineWidth: 1.0)
                            .frame(width: 115, height: 26)
                        Text(button)
                            .foregroundColor(isPressed ? .white : .black)
                            .font(.caption)
                    }
                }
            }
        }
    }


