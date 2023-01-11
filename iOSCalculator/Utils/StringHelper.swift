
import Foundation

//returns last character if it exists else return empty string
func getLastChar(str: String) -> String {
    /*if str.isEmpty {
        return ""
    } else {
        return String(str.last!)
    }*/
    return str.isEmpty ? "" : String(str.last!)
}

// return true if last character is same as char
func lastCharacterIsEqualTp(str: String, char: String) -> Bool {
    let last = getLastChar(str: str)
    return last == char
}

// return a string with decimal format point
func formatResult(val: Double) -> String {
    
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 16
    
    let result = numberFormatter
        .string(
            from: NSNumber(value: val)
        )
    
    return result ?? "0"
}

func lastCharacterIsDigit(str: String) -> Bool {
    return "0123456789".contains(getLastChar(str: str))
}

func lastCharacterIsDigitOrPercent(str: String) -> Bool {
    return "0123456789%".contains(getLastChar(str: str))
}

func lastCharacterIsAnOperator(str: String) -> Bool {
    return operators.contains(getLastChar(str: str))
}
