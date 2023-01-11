//
//  ContentView.swift
//  ExpirationDateApp
//
//  Created by frh alshaalan on 19/06/1444 AH.
//

import SwiftUI
import VisionKit
import AVFAudio
import Accessibility


struct ContentView: View {
    @AppStorage("key") var shouldshow = true
    @StateObject private var model = FrameHandler()
    @State private var SacnneDdate = ""
let string1 = NSLocalizedString("welcome", comment: "")
    @State private var startScanning = false
    @State private var scanText = ""

    var body: some View {
        
        VStack(spacing: 10) {
            Text(scanText).font(.system(size: 30))
                .accessibilityValue(scanText)

            VStack{
//                Text(scanText)
//                    .accessibilityValue(scanText)

                DataScanner(startScanning: $startScanning, scanText: $scanText)
                    .accessibilityElement()
                    .accessibilityValue(SacnneDdate)
                    .accessibilityValue(scanText)
                
                    .accessibilityValue(scanText)
                    .ignoresSafeArea()
            }
            .accessibilityValue(SacnneDdate)
            
            

                
        }
        .fullScreenCover(isPresented: $shouldshow) {
            OnBoarding(shouldshow: $shouldshow)}
        
        .task {
            if DataScannerViewController.isSupported && DataScannerViewController.isAvailable {
                startScanning.toggle()
            }
        }
       

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




