import SwiftUI

struct AboutUsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Title
            Text("About Us")
                .font(.largeTitle)
                .bold()
                .padding(.top)
            
            // Subtitle
            Text("Best flowers store in town")
                .font(.title3)
            
            // Description Text
            Text("Here you will feel the attitude, here you will receive quality, here you will see the atmosphere of an authentic flower store")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            // Carousel for Images
            ImageCarouselView(images: ["TopBuqet", "blueBuquet", "pinkBuquet"]) // Use your image names here
            
            // Additional Descriptive Text
            VStack(alignment: .leading, spacing: 8) {
                Text("Sit temporibus delectus vel. Tenetur est labore libero. Quod porro sit rerum.")
                    .font(.body)
                    .foregroundColor(.gray)
                
                Text("Occaecati non enim ab. Animi saepe neque voluptatem. Nulla aut dicta a.")
                    .font(.body)
                    .foregroundColor(.gray)
                
                Text("Soluta repellat facilis nostrum. Iste consequuntur at sunt. Dolores et perspiciatis dolor.")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

// Carousel for multiple images
struct ImageCarouselView: View {
    var images: [String]
    @State private var currentImageIndex = 0

    var body: some View {
        TabView(selection: $currentImageIndex) {
            ForEach(0..<images.count, id: \.self) { index in
                Image(images[index])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .cornerRadius(10)
                    .tag(index)
                    .clipped()
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .frame(height: 200)
    }
}

#Preview {
    AboutUsView()
}
