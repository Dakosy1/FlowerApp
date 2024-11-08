import SwiftUI

struct StoreView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Store Title
            Text("Store")
                .font(.largeTitle)
                .bold()
            
            // Subtitle
            Text("Time and location, for better results")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            // Date and Location Selectors
            VStack(spacing: 10) {
                Button(action: {
                    print("Date button tapped")
                }) {
                    HStack {
                        Image(systemName: "calendar")
                        VStack(alignment: .leading) {
                            Text("Date")
                                .font(.headline)
                            Text("Select delivery date")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .foregroundStyle(.black)
                }
                
                Button(action: {
                    print("Location button tapped")
                }) {
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                        VStack(alignment: .leading) {
                            Text("Location")
                                .font(.headline)
                            Text("Select delivery region")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .foregroundStyle(.black)
                }
            }
            
            // Carousel Header
            Text("Top bouquets")
                .font(.headline)
            
            // Manual Carousel for Bouquets
            ManualBouquetCarousel()
            
            // Categories Section
            Text("Categories")
                .font(.headline)
            
            // Categories Grid
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                CategoryButton(title: "Roses", action: {
                    print("Roses category tapped")
                })
                CategoryButton(title: "Tulips", action: {
                    print("Tulips category tapped")
                })
                CategoryButton(title: "Roses", action: {
                    print("Roses category tapped")
                })
                CategoryButton(title: "Hydrangea", action: {
                    print("Hydrangea category tapped")
                })
            }
            
            Spacer()
        }
        .padding()
    }
}

// Manual Carousel Component
struct ManualBouquetCarousel: View {
    let bouquetData = [
        ("TopBuqet", "Orange bouquets", "$13.00", "$15.00"),
        ("blueBuquet", "Blue roses", "$18.00", "$20.00"),
        ("pinkBuquet", "White lilies", "$25.00", "$30.00")
    ]
    
    @State private var selectedBouquetIndex: Int = 0

    var body: some View {
        TabView(selection: $selectedBouquetIndex) {
            ForEach(0..<bouquetData.count, id: \.self) { index in
                let bouquet = bouquetData[index]
                
                // Bouquet Card in Carousel
                VStack(alignment: .leading) {
                    Image(bouquet.0)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(bouquet.1)
                            .font(.headline)
                        
                        HStack(spacing: 5) {
                            Text(bouquet.2)
                                .foregroundColor(.red)
                            Text(bouquet.3)
                                .strikethrough()
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                }
                .background(Color(.systemGray6)) // Background applied to entire card
                .cornerRadius(10)
                .padding(.horizontal, 20)
                .tag(index)
                .frame(height: 300)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .frame(height: 300)
    }
}

// Custom Button for Category
struct CategoryButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray5))
                .cornerRadius(10)
                .font(.subheadline)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    StoreView()
}
