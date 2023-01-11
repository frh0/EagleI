//
//  SplashScreenView.swift
//  test
//
//  Created by Hadeel Alturaier on 09/04/1444 AH.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isPressed1 = false
    @State var isPressed = false

    @State private var isActive = false
    @State private var size = 0.5
    @State private var opacity = 0.3
    
    
    var body: some View {
        if isActive {
            ContentView()
        
        } else {
            
            
            ZStack{  Color("Orange")
                    .ignoresSafeArea()
                VStack{
                    
                    VStack{
                        Image("splashpic")
                            .resizable()
                            .frame(width: 321, height: 64)
                       
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.5)) {
                            self.size = 0.9
                            self.opacity = 1.0
                            
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        withAnimation{
                            self.isActive = true
                        }
                    }
                }
                
            }
        }
    }
}
struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
