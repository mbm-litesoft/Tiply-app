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
struct LSRadioButton: View {
    public var items: [String]
    @State private var selectedOption = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(Array(items.enumerated()), id: \.0) { index, item in
                // Option 1
                RadioButton(
                    title: item,
                    isSelected: selectedOption == index,
                    action: { selectedOption = index }
                )
            }
        
            
           
        }
        .padding()
    }
}

#Preview {
    LSRadioButton(items: ["Coca", "Cola"])
        .modelContainer(for: Item.self, inMemory: true)
    
}
