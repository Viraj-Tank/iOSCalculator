
import Foundation

enum Operation {
        case add, subtract, multiply, divide, equal, none
}

enum CalcButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case multiply = "×"
    case divide = "÷"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "IMGplus.forwardslash.minus"
    case undo = "IMGarrowshape.backward"
}

let enumOperators: [CalcButton] = [
    .subtract,
    .add,
    .divide,
    .multiply
]

let multiplySymbol = CalcButton.multiply.rawValue

let divisionSymbol = CalcButton.divide.rawValue

let operators: String = "+-\(multiplySymbol)\(divisionSymbol)"