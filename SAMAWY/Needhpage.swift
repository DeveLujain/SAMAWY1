import SwiftUI

struct Needhpage: View {
    var body: some View {
        NavigationStack { // Wrap the entire view in NavigationStack
            ZStack {
                Image("exported backg") // الخلفية
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                Image("top-icons")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .position(x: 200, y: 70)

                // Back button (Go back in the stack)
                NavigationLink(destination: Heba().navigationBarBackButtonHidden(true)) {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }
                .position(x: 50, y: 70)

                // Sad Cloud Image
                Image("SADCLOUD")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
                    .position(x: 200, y: 300)

                // Sad text
                Text("No worries, it’s alright to feel sad sometimes..")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 140)
                    .padding([.leading, .trailing], 30)

                VStack {
                    Spacer()

                    // Button to navigate to Rasha page
                    NavigationLink(destination: Rasha().navigationBarBackButtonHidden(true)) {
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

                // Home button to navigate to Maryam page
                NavigationLink(destination: Maryam().navigationBarBackButtonHidden(true)) {
                    Image(systemName: "house.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }
                .position(x: 340, y: 70) // Position in the top right corner
            }
            .navigationTitle("") // Set navigation title to empty
            .navigationBarBackButtonHidden(true) // Hide the default back button for the entire view
        }
    }
}

struct Needhpage_Previews: PreviewProvider {
    static var previews: some View {
        Needhpage()
    }
}
