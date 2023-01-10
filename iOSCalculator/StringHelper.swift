
import Foundation

//returns last character if it exists else return empty string
func getLastChat(str: String) -> String {
    /*if str.isEmpty {
        return ""
    } else {
        return String(str.last!)
    }*/
    return str.isEmpty ? "" : String(str.last!)
}

// return true if last character is same as char
func lastCharacterIsEqualTp(str: String, char: String) -> Bool {
    let last = getLastChat(str: str)
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
