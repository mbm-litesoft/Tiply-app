
import SwiftUI

struct CheckBoxSingleSelect: View {
    @Binding var selection: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            // Option 1
            checkboxItem(id: "option1", title: "Active")
            
            // Option 2
            checkboxItem(id: "option2", title: "Non-active")
            
            
        }
        .padding()
    }
    
    private func checkboxItem(id: String, title: String) -> some View {
        Button(action: {
            selection = id
        }) {
            HStack {
                // Case à cocher
                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(
                            selection == id  ? Color(
                                LSColors().LSColorsPrimaryBlue
                            ) : .white
                        )
                        .stroke(selection == id ? Color(
                            LSColors().LSColorsPrimaryBlue
                        ) : Color.gray, lineWidth: 2)
                        .frame(width: 20, height: 20)
                    
                    if selection == id {
                        Image(systemName: "checkmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12, height: 12)
                            .foregroundColor(Color.white)
                    }
                }
                Text(title)
                    .foregroundColor(.primary)
                
                Spacer()
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct CheckBoxesDemo: View {
    @State private var selectedOption = "option1"
    
    var body: some View {
        CheckBoxSingleSelect(selection: $selectedOption)
            .font(
                .custom(
                    "Montserrat-semiBold",
                    size: 12,
                    relativeTo: .title2
                )
            )

    }
}


#Preview {
    CheckBoxesDemo()
        .modelContainer(for: Item.self, inMemory: true)
}
