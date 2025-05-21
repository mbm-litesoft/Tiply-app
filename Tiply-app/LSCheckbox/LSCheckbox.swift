
import SwiftUI

struct CheckBoxSingleSelect: View {
    @Binding var selection: Int
    public var items: [String]
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(Array(items.enumerated()), id: \.0) { index, item in
                checkboxItem(id: index, title: item)
            }
        }
        .padding()
    }
    
    private func checkboxItem(id: Int, title: String) -> some View {
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
    @State private var selectedOption = 0
    public var items: [String] = []
    var body: some View {
        CheckBoxSingleSelect(selection: $selectedOption, items: items)
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
    CheckBoxesDemo(items: ["item1", "item2"])
        .modelContainer(for: Item.self, inMemory: true)
}
