
import SwiftUI

struct CalcsButtonView: View {
    
    @Binding var currentComputation: String
    @Binding var mainResult: String
    
    let buttonData : [RowOfCalcButtonsModel] = [
        RowOfCalcButtonsModel(
            row: [
                CalcButtomModel(calcButton: .clear, color: foregroundTopButtons),
                CalcButtomModel(calcButton: .negative, color: foregroundTopButtons),
                CalcButtomModel(calcButton: .percent, color: foregroundTopButtons),
                CalcButtomModel(calcButton: .divide, color: foregroundRightButtons)
            ]
        ),
        RowOfCalcButtonsModel(
            row: [
                CalcButtomModel(calcButton: .seven),
                CalcButtomModel(calcButton: .eight),
                CalcButtomModel(calcButton: .nine),
                CalcButtomModel(calcButton: .multiply, color: foregroundRightButtons)
            ]
        ),
        RowOfCalcButtonsModel(
            row: [
                CalcButtomModel(calcButton: .four),
                CalcButtomModel(calcButton: .five),
                CalcButtomModel(calcButton: .six),
                CalcButtomModel(calcButton: .subtract, color: foregroundRightButtons)
            ]
        ),
        RowOfCalcButtonsModel(
            row: [
                CalcButtomModel(calcButton: .one),
                CalcButtomModel(calcButton: .two),
                CalcButtomModel(calcButton: .three),
                CalcButtomModel(calcButton: .add, color: foregroundRightButtons)
            ]
        ),
        RowOfCalcButtonsModel(
            row: [
                CalcButtomModel(calcButton: .undo),
                CalcButtomModel(calcButton: .zero),
                CalcButtomModel(calcButton: .decimal),
                CalcButtomModel(calcButton: .equal, color: foregroundRightButtons)
            ]
        )
    ]
    
    var body: some View {
        Grid {
            ForEach(buttonData) { rowOfCalcButtonsModel in
                GridRow {
                    ForEach(rowOfCalcButtonsModel.row) { calcButtonModel in
                        
                        Button(action: {
                            
                        }, label: {
                            ButtonView(calcButton: calcButtonModel.calcButton, fgColor: calcButtonModel.color, bgColor: buttonBackground)
                        })
                    }
                }
            }
        }
        .padding()
        .background(
            secondaryBackground.cornerRadius(20)
        )
    }
}

struct CalcsButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CalcsButtonView(currentComputation: .constant("5+1"), mainResult: .constant("6"))
    }
}

struct CalcButtomModel: Identifiable {
    let id = UUID()
    let calcButton: CalcButton
    var color: Color = foregroundDigits
}

struct RowOfCalcButtonsModel: Identifiable {
    let id = UUID()
    let row: [CalcButtomModel]
}
