import SwiftUI
import MapKit

struct ContactUsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Title
            Text("Contacts")
                .font(.largeTitle)
                .bold()
                .padding(.top)
            
            // Contact Information Sections
            VStack(spacing: 10) {
                ContactInfoRow(icon: "phone.fill", title: "Phone:", detail: "+7 (747) 444-12-19")
                
                ContactInfoRow(icon: "location.fill", title: "Address:", detail: "Expo C1.1")
                
                ContactInfoRow(icon: "clock.fill", title: "Working Hours:", detail: "9 AM - 8 PM")
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(.black)
                        Text("Health and safety:")
                            .font(.headline)
                    }
                    Text("Mask required · Temperature check required · Staff wear masks · Staff get temperature checks")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
            
            // Map Section
            MapView()
                .frame(height: 200)
                .cornerRadius(10)
                .padding(.horizontal, -20) // Makes the map full width, can adjust if needed
            
            // Directions Button
            Button(action: {
                print("Get directions tapped")
            }) {
                HStack {
                    Image(systemName: "map.fill")
                    Text("Get directions")
                        .font(.headline)
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .cornerRadius(10)
            }
            .padding(.top)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

// Reusable component for each contact information row
struct ContactInfoRow: View {
    var icon: String
    var title: String
    var detail: String
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: icon)
                .foregroundColor(.black)
                .frame(width: 20)
            Text(title)
                .font(.headline)
            Text(detail)
                .font(.subheadline)
                .foregroundColor(.gray)
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

// Custom Map View
struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.7648, longitude: -73.9808), // Sample coordinates
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

#Preview {
    ContactUsView()
}
