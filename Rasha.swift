import SwiftUI

struct Rasha: View {
    @State private var isCloudFloating = false // Track cloud animation movement
    @State private var currentPage = 0 // Track the current page of text boxes
    @State private var likedSuggestions = [false, false, false, false, false, false] // Track if the user liked each text box
    @State private var buttonClicked = false // Track whether the "Done" button was clicked
    @State private var isHomeActive = false // Track the home button state
    @State private var homeButtonColor: Color = .white // Track the home button color
    @Environment(\.presentationMode) var presentationMode // For custom back button action
    @State private var suggestions = [
        "Plant something and take care of it—a symbol of healing",
        "Make a simple, colorful dish and enjoy the process of cooking",
        "Look at old photos or listen to songs from a happy memory",
        "Try grounding exercises by focusing on what's around you,it helps break negative thoughts",
        "Take a moment to list five things around you that make you grateful",
        "Imagine your feelings as characters. What would they say?"
    ] // Array of suggestions

    var body: some View {
        NavigationView { // Wrap in NavigationView to enable navigation
            ZStack {
                // Background Image
                Image("Background1")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    // Weather icons and custom back & home button
                    HStack {
                        // NavigationLink for the custom Back Button on the top-left corner
                        NavigationLink(destination: Needhpage()) { // Navigate to Needhpage when back button is clicked
                            Image(systemName: "chevron.backward") /// Custom back arrow
                                .font(.system(size: 24)) // Adjust the size
                                .foregroundColor(.white) // Change the color
                                .padding(.top, -15)

                        }
                        .padding(.leading, 20)

                        Spacer()

                        // Weather icons in the center
                        Image("emojis")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .padding(.leading, 20)
                            .padding(.top, -50)
 
                        Spacer()

                        // NavigationLink for the home button
                        NavigationLink(destination: Maryam()) { // Navigate to Maryam when home button is clicked
                            Image(systemName: "house.fill")
                                .foregroundColor(homeButtonColor) // Change color based on active state
                                .font(.system(size: 24)) // Same size for the icon
                                .padding(.top, -10)
                        }
                        .padding(.trailing, 20) // Align the home button to the top-right
                    }
                    .padding(.top, 30) // Align both weather icons and home button to the same level
                    .navigationBarBackButtonHidden(true) // Hide the default back button
                    
                    // Cloud Image with floating effect
                    Image("SADCLOUD")
                        .resizable() // Make the image resizable
                        .scaledToFit() // Maintain the aspect ratio
                        .frame(width: 250, height: 200) // Change the size by setting width and height
                        .offset(y: isCloudFloating ? -10 : 10) // Move the cloud up and down
                        .animation(
                            Animation.easeInOut(duration: 2).repeatForever(autoreverses: true),
                            value: isCloudFloating
                        )
                        .onAppear {
                            isCloudFloating.toggle() // Start the animation
                        }

                    // Umbrella Image
                    Image("umbrella")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 160)
                        .padding(.bottom, -60)
                    
                    // Swipeable Text Boxes with Text and Heart Icon inside
                    TabView(selection: $currentPage) {
                        ForEach(0..<suggestions.count, id: \.self) { index in
                            ZStack {
                                Image("textBoxImage")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 400, height: 200)
                                
                                VStack {
                                    // Text inside the card, centered and clearly aligned
                                    Text(suggestions[index])
                                        .font(.title3) // Adjust font size to fit inside the box
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(red: 0.1, green: 0.2, blue: 0.6))
                                        .multilineTextAlignment(.center) // Align the text to the center
                                        .padding(.horizontal, 93) // Add padding to ensure the text doesn't touch the edges
                                        .frame(maxWidth: .infinity, maxHeight: .infinity) // Make text fill the available space in the box
                                        .padding(.top, 20) // Adjusted padding for top alignment
                                        .padding(.bottom, -20) // Adjust bottom padding for space for heart button
                                    
                                    HStack {
                                        Spacer()
                                        
                                        // Heart Button inside the card
                                        Button(action: {
                                            likedSuggestions[index].toggle() // Toggle the like state for this specific suggestion
                                        }) {
                                            Image(systemName: likedSuggestions[index] ? "heart.fill" : "heart")
                                                .font(.system(size: 30))
                                                .foregroundColor(likedSuggestions[index] ? .red : .gray)
                                        }
                                        .contentShape(Rectangle()) // Ensure the tappable area covers the icon
                                        .padding(.trailing, 150)
                                        .padding(.bottom, 35)
                                        
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Adds swipeable pages with dots
                    .frame(height: 250)
                    
                    // Dots Below the Text Box
                    PageControl(currentPage: $currentPage, numberOfPages: suggestions.count)
                        .frame(width: 100, height: 20) // Adjust the width and height as needed
                        .padding(.top, 10)

                    Spacer()

                    // NavigationLink with Button that changes background color
                    NavigationLink(destination: Rasha2()) {
                        Text("Done")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                            .frame(width: 133, height: 41)
                            .background(buttonClicked ? Color(red: 251/255, green: 235/255, blue: 139/255) : Color.white) // Background color changes when clicked
                            .cornerRadius(22)
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        buttonClicked.toggle() // Toggle background color when the button is clicked
                    })
                    .padding(.bottom, 55) // Position the button at the bottom
                }
                .padding()
            }
        }
    }
}

// PageControl to manage dots
struct PageControl: UIViewRepresentable {
    @Binding var currentPage: Int
    var numberOfPages: Int

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.currentPageIndicatorTintColor = .white
        control.pageIndicatorTintColor = UIColor.white.withAlphaComponent(0.2)
        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
}

#Preview {
    Rasha()
}
