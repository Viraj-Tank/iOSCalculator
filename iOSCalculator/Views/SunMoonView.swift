
import SwiftUI

struct SunMoonView: View {
    
    var lightMode: Bool
    
    var body: some View {
        HStack(spacing: 28) {
            Image(systemName: "sun.min")
                .imageScale(.large)
                .foregroundColor(
                    lightMode ?sunOrMoonSelected : sunOrMoonNotSelected
                )
            Image(systemName: "moon")
                .imageScale(.large)
                .foregroundColor(
                    lightMode ? sunOrMoonNotSelected : sunOrMoonSelected
                )
        }.padding()
            .background(secondaryBackground)
            .cornerRadius(20)
    }
}

struct SunMoonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SunMoonView(lightMode: true)
            SunMoonView(lightMode: false)
        }
    }
}
