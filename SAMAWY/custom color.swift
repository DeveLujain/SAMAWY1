import SwiftUI

extension Color {
    init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}

struct CustomColor: View {
    @Binding var selectedColor: Color
    
    // Array of colors
    private let colors: [Color] = [
        Color(hex: "DAD8D6") ?? .clear, // Whitecloud
        Color(hex: "F2C5AB") ?? .clear, // Peachcloud
        Color(hex: "C6E6AB") ?? .clear, // Greencloud
        Color(hex: "FBEB8B") ?? .clear, // Ycloud
        Color(hex: "E3F4F4") ?? .clear  // image5
        
    ]
    
    // Array of image names corresponding to the colors
    private let imageNames: [String] = [
        "whitecloud",  // Color: DAD8D6
        "peachcloud",  // Color: F2C5AB
        "greencloud",  // Color: C6E6AB
        "Ycloud",      // Color: E3F4F4
//        "image5"       // Color: FBEB8B
            
    ]
    
    var body: some View {
        
           
    VStack {
        
            // Display the image associated with the selected color
            Image(selectedImageName)   //cloud image
                .resizable()
                .scaledToFit()
                .frame(width: 300.0, height: 250)
                .position(x:180, y:140)
        
        VStack {
            Text("Dress me in colors!")
                          .font(.title2)
                          .fontWeight(.semibold)
                          .foregroundColor(Color(hue: 0.083, saturation: 0.016, brightness: 0.973))
                          .position(x: 180,  y:150)
        }
       
            //scrolling
            ScrollView(.horizontal) {
                HStack {
                    ForEach(colors.indices, id: \.self) { index in
                        Circle()
                            .foregroundColor(colors[index])
                            .frame(width: 45, height: 45)
                            .opacity(colors[index] == selectedColor ? 0.5 : 1.0)
                            .scaleEffect(colors[index] == selectedColor ? 1.1 : 1.0)
                            .onTapGesture {
                                selectedColor = colors[index]
                            }
                    }
                }
                .padding()  //بادنق دوائر الالوان
                .background(.thinMaterial)
                .cornerRadius(20)
                .padding(.horizontal)
                .position(x:180, y: 100)
            }
      }
    }
    
    private var selectedImageName: String {
        // Find the index of the selected color and return the corresponding image name
        if let index = colors.firstIndex(of: selectedColor) {
            return imageNames[index]
        }
        return "Ycloud" // Fallback image name if no match is found
    }
}

struct Coloring: View {
    @State private var selectedColor: Color = .black

    var body: some View {
        VStack {
            CustomColor(selectedColor: $selectedColor)
                .position(x: 225, y: 400)
            // Additional views can go here
        }
    }
}

struct CustomColor_Previews: PreviewProvider {
    static var previews: some View {
    pickcolor()
    }
}
