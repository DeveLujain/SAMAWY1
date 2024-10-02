//
//  Heba.swift
//  SAMAWY
//
//  Created by Heba Almohaisn on 29/03/1446 AH.
//

import SwiftUI

struct Heba: View {
    @State private var floatOffset: CGFloat = 0
    @State private var activeButton: ButtonType? // Track the active button state
    @State private var isHomeActive = false // Track the home button state
    @State private var homeButtonColor: Color = .white // Track the home button color

    enum ButtonType {
        case sad, angry, bored, fine
    }

    var body: some View {
        ZStack {
            // Background image
            Image("Background1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            // Increase the size of the Icons image
            Image("Icons")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120) // Made it a bit bigger
                .position(x: 200, y: 80)
            
            // Home button changed to house.fill
            Button(action: {
                isHomeActive.toggle() // Toggle home button state
                homeButtonColor = isHomeActive ? Color(red: 251/255, green: 235/255, blue: 139/255) : Color.white // Change color based on active state
            }) {
                Image(systemName: "house.fill") // Changed to house.fill
                    .foregroundColor(homeButtonColor) // Change color based on active state
                    .font(.system(size: 24)) // Made it a little smaller
            }
            .position(x: 340, y: 70) // Position in the top right corner

            // Foreground image with floating effect
            Image("r") // Replace with your foreground image name
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
                .padding()
                .offset(y: floatOffset)
                .position(x: 200, y: 350)
                .onAppear {
                    startFloating()
                }
            
            Text("Pleased to meet you Falak!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(.bottom, 500)
            
            Text("How are you feeling today?")
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(Color.white)
                .padding(.top)
                .position(x: 200, y: 480)
            
            // Sad Button
            buttonView(title: "Sad", type: .sad)
                .position(x: 200, y: 570)

            // Angry Button
            buttonView(title: "Angry", type: .angry)
                .position(x: 200, y: 620)

            // Bored Button
            buttonView(title: "Bored", type: .bored)
                .position(x: 200, y: 670)

            // Fine Button
            buttonView(title: "Fine", type: .fine)
                .position(x: 200, y: 720)
        }
    }

    private func buttonView(title: String, type: ButtonType) -> some View {
        Button(action: {
            activeButton = (activeButton == type) ? nil : type // Toggle the button state
        }) {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(Color.black) // Set text color to black
                .frame(width: 133, height: 41)
                .background(activeButton == type ? Color(red: 251/255, green: 235/255, blue: 139/255) : Color.white) // Change background color
                .cornerRadius(22)
        }
    }
    
    private func startFloating() {
        withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
            floatOffset = 10
        }
    }
}

#Preview {
    Heba()
}
