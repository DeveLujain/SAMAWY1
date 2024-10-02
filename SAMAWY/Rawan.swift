import SwiftUI

struct RAWAN1: View {
    @State private var offset: CGFloat = 0
    @State private var name: String = "" // Make sure this is declared as @State
    
    var body: some View {
        ZStack {
            // Background image
            Image("exported backg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
           
            Image("emojis")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .position(x: 200, y: 80)
            
            // Foreground image (stars)
            Image("stars")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                .padding()
                .position(x: 190, y: 248)
            
            // Moving foreground image (r) positioned below the text
            VStack {
                Spacer() // Push content upwards
                
                Image("r")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
                    .padding()
                    .offset(y: offset) // Use offset for animation

                // Text and input fields
                HStack {
                    Text("Let ")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.973, green: 0.9647, blue: 0.9569))
                    +
                    Text("Samawy")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 200/255, green: 225/255, blue: 231/255)) // C8E1E7
                    +
                    Text(" help you track your moods and clear the skies for a brighter day!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.973, green: 0.9647, blue: 0.9569))
                }
                .padding(.horizontal) // Add horizontal padding
                .multilineTextAlignment(.center)
                .padding(.top)
                
                TextField("Username", text: $name)
                    .padding() // Original padding
                    .background(Color(red: 13/255, green: 9/255, blue: 57/255))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    .frame(width: 292)
                    .padding(.top, 20) // Adjust this value to increase space below the text
                
                VStack {
                    // Action Button with dynamic opacity
                    Button(action: {
                        // Action for button tap
                        print("Button tapped, name: \(name)")
                    }) {
                        Text("Let’s Start")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 71/255, green: 71/255, blue: 74/255)) // Updated color
                            .padding()
                            .frame(width: 147, height: 41)
                            .background(Color(red: 209/255, green: 233/255, blue: 246/255).opacity(name.isEmpty ? 0.45 : 1.0)) // Dynamic opacity
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                            .cornerRadius(21)
                    }
                    .padding(25)
                }
                .disabled(name.isEmpty) // Disable button if no input

                Spacer() // Add space at the bottom
            }
            .padding([.leading, .trailing]) // Padding for the VStack
        }
        .onAppear {
            startMoving()
        }
    }

    func startMoving() {
        withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
            offset = 10 // Move up by 10 points
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RAWAN1()
    }
}
