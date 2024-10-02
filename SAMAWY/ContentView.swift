//
//  ContentView.swift
//  SAMAWY
//
//  Created by Lujain sh on 02/10/2024.
//
//pick colour page
import SwiftUI

struct ContentView: View {
    
 //   @State var selectedColor = Color.gray
    
    var body: some View {
        ZStack {
            Image("background")
                .imageScale(.large)
                .ignoresSafeArea()
            
            Image ("logo")
                .padding(.bottom, 698.415)
                .frame(width: 900.0, height: 80.0)
            
            HStack{
                Image(systemName: "arrow.backward")
                    .foregroundColor(Color.white)
                    .position(x:290
                              , y: 70)
            }
            
            VStack{
                Text("Pleased to meet you Falak!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.9725490196078431, green: 0.9647058823529412, blue: 0.9568627450980393)/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .padding(.top, -260.0)
                    .frame(width: 300.0)
                
                Image ("Whitecloud")
                    .padding(.top, -150.0)
                
                Text("Dress me in colors!")
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.9725490196078431, green: 0.9647058823529412, blue: 0.9568627450980393))
                    .padding(.top, 30.0)
//
                    
                    
                }
                .padding()
                
            }
            .imageScale(/*@START_MENU_TOKEN@*/.medium/*@END_MENU_TOKEN@*/)
        }
    }
    
    #Preview {
        ContentView()
    }
