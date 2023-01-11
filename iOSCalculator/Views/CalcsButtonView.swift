
import SwiftUI

struct CalcsButtonView: View {
    
    // if any view changes the original we pass it as a binding variable using $
    // so whenever value changes of binding variable original variable's value will also be change
    
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
                            buttonPressed(
                                calcButton: calcButtonModel.calcButton
                            )
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
    
    func buttonPressed(calcButton: CalcButton) {
        switch(calcButton) {
        case .clear:
            currentComputation = ""
            mainResult = "0"
            
        case .equal, .negative:
            if !currentComputation.isEmpty {
                if !lastCharacterIsAnOperator(str: currentComputation) {
                    let sign =
                    calcButton == .negative
                    ? -1.0
                    : 1.0
                    
                    mainResult = formatResult(
                        val: sign * calculateResults()
                    )
                    
                    if calcButton == .negative {
                            currentComputation = mainResult
                    }
                    
                }
            }
            
        case .decimal:
            if let lastOccurenceOfDecimal = currentComputation.lastIndex(of: ".") {
                if lastCharacterIsDigit(str: currentComputation) {
                    
                    // startIndex will target next number after first occurence of .(dot)
                    // so suppose we have 123.456
                    // so it will go to . which is at third position
                    // and then offsetby = 1 so it will store its next index into startIndex
                    // so we can get 456 number into decimal
                    let startIndex = currentComputation.index(lastOccurenceOfDecimal,offsetBy: 1)
                    let endIndex = currentComputation.endIndex
                    
                    let afterDecimalValueRange = startIndex ..< endIndex
                    
                    let rightSubstring = String(currentComputation[afterDecimalValueRange])
                    
                    // only have digits to the right "."
                    // that means do not add another "."
                    // otherwise we can add another decimal point
                    
                    // 23.37+108 if good -> 23.37+108.
                    // 123.45 it will come nil as below Int() condition
                    // because it will successfully convert to Int
                    if Int(rightSubstring) == nil && !rightSubstring.isEmpty {
                            currentComputation += "."
                    }
                }
            } else {
                if currentComputation.isEmpty {
                    currentComputation += "0."
                } else if lastCharacterIsDigit(str: currentComputation) {
                    currentComputation += "."
                }
            }
            
            
        case .percent:
            if lastCharacterIsDigit(str: currentComputation) {
                appendToCurrentComputation(calcButton: calcButton)
            }
            
        case .undo:
            currentComputation = String(currentComputation.dropLast())
            
        case .add, .subtract, .multiply, .divide:
            if lastCharacterIsDigitOrPercent(
                str: currentComputation
            ) {
                appendToCurrentComputation(calcButton: calcButton)
            }
            
        default:
            // for zero to nine we'll pick value from enum itself
            appendToCurrentComputation(calcButton: calcButton)
        }
    }
    
    // implements the actual computation of calculator
    func calculateResults() -> Double {
        let visibleWorkings: String = currentComputation
        // we're converting this becuase we'll use inbuilt expression function
        // and we need to add sign which are understandable by compiler
        var workings = visibleWorkings.replacingOccurrences(
            of: "%",
            with: "*0.01")
        workings = workings
            .replacingOccurrences(
                of: multiplySymbol,
                with: "*")
        workings = workings
            .replacingOccurrences(
                of: divisionSymbol,
                with: "/")
        
        // if we have . at last like "10." it will replace it to "10.0"
        if getLastChar(str: visibleWorkings) == "." {
            workings += "0"
        }
        
        // key point
        // actual computation
        
        let expr = NSExpression(format: workings)
        let exprValue = expr.expressionValue(with: nil, context: nil) as! Double
        return exprValue
    }
    
    func appendToCurrentComputation(calcButton: CalcButton) {
        currentComputation += calcButton.rawValue
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
