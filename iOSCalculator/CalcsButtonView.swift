
import SwiftUI

struct CalcsButtonView: View {
    
    @Binding var currentComputation: String
    @Binding var mainResult: String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CalcsButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CalcsButtonView(currentComputation: .constant("5+1"), mainResult: .constant("6"))
    }
}
