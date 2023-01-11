

//
//  ContentView.swift
//  onbording page
//
//  Created by Hadeel Alturaier on 16/06/1444 AH.
//

import SwiftUI

struct OnBoardingStep {
    
    let image: String
    let title: String
    let description: String
}

private let onBoardingSteps = [
    OnBoardingStep (image: "onbording1", title: "Go to Supermarket", description: "You want to read the expiration date of the product but the font is not clear."),
    OnBoardingStep (image: "onbording2", title: "Start Shopping", description: "Point your iphone camera at the expiration date."),
    OnBoardingStep (image: "onbording3", title: "Depend on Your Self", description: "The reader will read the expiration date to you.")]



struct OnBoarding: View {
    @State private var currentStep = 0
    
//    init() {
//        UIScrollView.appearance () .bounces = false
//    }
//    @AppStorage ("hasSeenOnboarding") private var hasSeenOnboarding = false
    @Binding var shouldshow : Bool
    
    var body: some View {
        VStack {
            HStack{
                Spacer ()
                Button(action: {
                    self.currentStep = onBoardingSteps.count - 1
                }){
                    HStack{Text ("Skip")
                        Image(systemName:"chevron.forward")
                    }
                    
                    .padding(.trailing, 30.0)
                    .font(.system(size: 24))
                    .foregroundColor (Color("Orange"))
                }
            }
            
            TabView(selection: $currentStep) {
                ForEach(0..<onBoardingSteps.count) { it in
                    VStack {
                        Image (onBoardingSteps[it].image)
                            .resizable ()
                            .frame (width: 304, height: 447)
                            .padding (.bottom, 10.0)
                        Text (onBoardingSteps[it].title)
                            .font(.system(size: 26))
                            .fontWeight(.heavy)
                            .padding(.bottom, 1.0)
                        
                        Text (onBoardingSteps[it].description)
                            .multilineTextAlignment (.center)
                            .padding (.horizontal,44)
                            .font(.system(size: 21))
                    }
                    .tag(it)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            
            Button (action:{
                if self.currentStep < onBoardingSteps .count - 1 {
                    self.currentStep += 1
                } else {
                }
                
                shouldshow = false
}){
                    if(currentStep == 2 ){
                        Text ("Start")
                            .fontWeight(.medium)
                            .padding (10)
                        
                            .font(.system(size: 24))
                            .frame (maxWidth: .infinity)
                            .background(Color("Orange"))
                            .cornerRadius (11)
                            .padding(.horizontal, 44)
                            .foregroundColor(.white)
                            .padding (.bottom, 24)
                        
                    }
                    
                    
                    else {if(currentStep < 2 ){
                        Text ("Next")
                            .fontWeight(.medium)
                            .padding (10)
                        
                            .font(.system(size: 24))
                            .frame (maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius (11)
                            .padding(.horizontal, 44)
                            .foregroundColor(.white)
                            .padding (.bottom, 24)
                    }
                    }
                }
                .buttonStyle (PlainButtonStyle ())
            
            
            //.padding (.bottom, 40)
            //            VStack{
            //            Button (action:{
            //                if self.currentStep < onBoardingSteps .count - 1 {
            //                    self.currentStep += 1
            //                } else {
            //                }}){
            //                    if(currentStep == 2 ){
            //                        Text ("Start")
            //                            .fontWeight(.medium)
            //                        //.padding (10)
            //
            //                            .font(.system(size: 24))
            //                            .frame (maxWidth: .infinity)
            //                            .background(Color("Orange"))
            //                            .cornerRadius (11)
            //                            .padding(.horizontal, 44)
            //                            .foregroundColor(.white)
            //                            .padding (.bottom, 24)
            //
            //                    }
            //
            //
            //
            //                }
            //            .buttonStyle (PlainButtonStyle ())
            //
            //            .padding(.bottom,30)
            //            }
            HStack{
                ForEach (0..<onBoardingSteps.count) { it in
                    if it == currentStep {
                        Circle ()
                            . frame (width: 20, height: 20)
                            . foregroundColor (Color("Orange"))
                    } else {
                        Circle ()
                            . frame (width: 20, height: 20)
                            .foregroundColor (.gray)
                    }
                }
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
