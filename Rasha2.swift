//
//  Rasha2.swift
//  SAMAWY
//
//  Created by rasha on 02/04/1446 AH.
//

import SwiftUI

struct Rasha2: View {
    @Environment(\.presentationMode) var presentationMode // For going back in the navigation stack
    @State private var isFloating = false // Track the floating state for both cloud and text
    @State private var isHomeActive = false // Track the home button state
    @State private var homeButtonColor: Color = .white // Track the home button color

    var body: some View {
        ZStack {
            // Background Image (rain)
            Image("rain")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Image("Icons")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120) // Made it a bit bigger
                .position(x: 200, y: 80)

            VStack {
                // Custom Back Button and Home Button at the top
                HStack {
                    // Custom Back Button on the top-left corner
                    Button(action: {
                        presentationMode.wrappedValue.dismiss() // Go back to the previous page
                    }) {
                        // Custom icon and color for the back button
                         Image(systemName: "chevron.backward") // Use any system icon
                            .font(.system(size: 24)) // Adjust the size to 24
                            .foregroundColor(.white) // Set the color of the back arrow to yellow
                    }
                    .padding(.leading, 20)

                    Spacer()

                    // Home Button on the top right corner
                    Button(action: {
                        isHomeActive.toggle() // Toggle home button state
                        homeButtonColor = isHomeActive ? Color(red: 251/255, green: 235/255, blue: 139/255) : Color.white // Change color based on active state
                    }) {
                        Image(systemName: "house.fill")
                            .foregroundColor(homeButtonColor) // Change color based on active state
                            .font(.system(size: 24)) // Same size for the icon
                    }
                    .padding(.trailing, 40) // Align the home button to the top-right
                }
                .padding(.top, 50) // Adjust for the status bar and notch
                .navigationBarBackButtonHidden(true) // Hide default back button

                Spacer()

                // Text and cloud float together with interaction
                VStack(spacing: 20) {
                    // "Flufftastic!" Text
                    Text("Flufftastic!")
                        .font(.system(size: 36))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(y: isFloating ? -20 : 20) // Float the text up and down
                        .animation(
                            Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), // Smooth floating
                            value: isFloating
                        )

                    // Cloud Image
                    Image("cloudhappy") // Replace with your cloud asset name
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .offset(y: isFloating ? -10 : 10) // Cloud floats together with the text
                        .animation(
                            Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), // Smooth floating
                            value: isFloating
                        )
                }
                .onAppear {
                    isFloating = true // Start the floating effect when the view appears
                }
                .padding(.top, -150) // Keep the same padding for positioning

                Spacer()
            }
        }
    }
}

#Preview {
    Rasha2()
}
