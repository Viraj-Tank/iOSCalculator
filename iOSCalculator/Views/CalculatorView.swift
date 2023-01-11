
import SwiftUI

struct CalculatorView: View {
    
    @State var lightMode: Bool = true
    @State var currentComputation: String = ""
    @State var mainResult: String = "0"
    
    var body: some View {
        ZStack {
            primaryBackground.ignoresSafeArea()
            VStack {
                
                SunMoonView(
                    lightMode: lightMode
                ).onTapGesture {
                    withAnimation {
                        lightMode.toggle()
                    }
                }
                
                Spacer()
                
                ComputationView(
                    currentComputation: currentComputation,
                    mainResult: mainResult
                )
                
                Spacer()
                // if any view changes the original we pass it as a binding variable using $
                // so whenever value changes of binding variable original variable's value will also be change
                CalcsButtonView(
                    currentComputation: $currentComputation,
                    mainResult: $mainResult
                )
                    
            }
            .padding()
        }.environment(
            \.colorScheme,
             lightMode ? .light : .dark
        )
        // this environment will change to light and dark mode
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
