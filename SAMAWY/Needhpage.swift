//
//  Needhpage.swift
//  SAMAWY
//
//  Created by Lujain sh on 05/10/2024.
//

import SwiftUI

struct Needhpage: View {
    var body: some View {
                ZStack {
                    Image("exported backg") // الخلفية
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    
                        Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                        .position(x: 200, y: 80)
                    
                    Button(action: {
                        print("Back button tapped!")
                        // Add action for navigation or dismissal here
                    }) {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                    }
                    .position(x: 50, y: 70)
                    
                    Image("SADCLOUD")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                        .position(x: 200, y: 300)
                    
                    Text("No worries, it’s alright to feel sad sometimes..")
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 140.0)
                    
                    VStack {
                        Spacer()
                        
                        Button(action: {
                            print("I need help tapped!")
                        }) {
                            Text("Need help?")
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .frame(width: 150, height: 50)
                                .background(Color.white)
                                .cornerRadius(50)
                                .shadow(radius: 10)
                        }
                        .padding(.bottom, 150)
                    }
                    
                    Button(action: {
                        print("Home button tapped!")
                        // Add action for navigation to home here
                    }) {
                        Image(systemName: "house.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                    }
                    .position(x: 340, y: 70)
                }
            }
        }

        struct Needhpage_Previews: PreviewProvider {
            static var previews: some View {
                Needhpage()
            }
        }
#Preview {
    Needhpage()
}
