
import SwiftUI

struct ComputationView: View {
    
    let currentComputation: String
    let mainResult: String
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Spacer()
                Text(currentComputation)
                    .foregroundColor(foregroundDigits)
                    .lineLimit(1)
            }.minimumScaleFactor(0.1)
            // if our text go beyond the screen it will screen to 0.1 scalefactor if we dont add this it will put ...(three dot) at the end
            
            HStack {
                Spacer()
                Text(mainResult)
                    .foregroundColor(foregroundDigits)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .lineLimit(1)
            }.minimumScaleFactor(0.1)
        }.padding(.horizontal)
        
    }
}

struct ComputationView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            ComputationView(currentComputation: "12000+936", mainResult: "12936")
            Spacer()
            ComputationView(currentComputation: "76%", mainResult: "0.76")
            Spacer()
        }
    }
}
