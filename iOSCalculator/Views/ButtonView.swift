
import SwiftUI

struct ButtonView: View {
    let calcButton: CalcButton
    
    let fgColor: Color
    let bgColor: Color
    
    var systemImage: String? {
        let value = calcButton.rawValue
        return value.contains("IMG")
        ? value.replacingOccurrences(of: "IMG", with: "")
        : nil
    }
    
    let buttonDim: CGFloat = UIScreen.main.bounds.width / 5
    
    var text: String? {
        let value = calcButton.rawValue
        return value.contains("IMG")
        ? nil
        : value
    }
    
    var body: some View {
        ZStack {
            Text(text ?? "")
            Image(systemName: systemImage ?? "")
        }
        .font(.title2)
        .fontWeight(.semibold)
        .frame(width: buttonDim,height: buttonDim)
        .foregroundColor(fgColor)
        .background(bgColor)
        .clipShape(RoundedRectangle(cornerRadius: 15))
//        .overlay(
//            RoundedRectangle(cornerRadius: 15)
//                .stroke(primaryBackground, lineWidth: 1)
//        )
        .shadow(color: bgColor.opacity(0.5), radius: 3, x: 5, y: 5)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ButtonView(calcButton: CalcButton.undo, fgColor: foregroundDigits, bgColor: buttonBackground)
            ButtonView(calcButton: CalcButton.percent, fgColor: foregroundDigits, bgColor: buttonBackground)
            ButtonView(calcButton: CalcButton.add, fgColor: foregroundRightButtons, bgColor: buttonBackground)
        }
    }
}
