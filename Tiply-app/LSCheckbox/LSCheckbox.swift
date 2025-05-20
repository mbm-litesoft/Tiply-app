import SwiftUI

// Composant radio unique
struct RadioButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                // Cercle de sélection
                ZStack {
                    Circle()
                        .stroke(Color(LSColors().LSColorsPrimaryBlue))
                        .frame(width: 20, height: 20)
                    
                    if isSelected {
                        Circle()
                            .fill(Color(LSColors().LSColorsPrimaryBlue))
                            .frame(width: 12, height: 12)
                    }
                }
                
                // Texte du bouton
                Text(title)
                    .foregroundColor(.primary)
                
                Spacer()
            }
            .font(
                .custom(
                    "Poppins-SemiBold",
                    size: 10,
                    relativeTo: .title2
                )
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// Exemple d'utilisation
struct RadioDemo: View {
    @State private var selectedOption = "option1"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Option 1
            RadioButton(
                title: "Active",
                isSelected: selectedOption == "option1",
                action: { selectedOption = "option1" }
            )
            
            // Option 2
            RadioButton(
                title: "Non-active",
                isSelected: selectedOption == "option2",
                action: { selectedOption = "option2" }
            )
            
           
        }
        .padding()
    }
}

#Preview {
    RadioDemo()
        .modelContainer(for: Item.self, inMemory: true)
    
}
