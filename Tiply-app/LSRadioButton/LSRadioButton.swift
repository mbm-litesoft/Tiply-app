//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI

struct ImageToggleStyle: ToggleStyle {

    @State var mm: Bool = true

    func makeBody(configuration: Configuration) -> some View {

        Button {
            withAnimation(.easeInOut(duration: 0.2)) {

                configuration.isOn.toggle()

            }

        } label: {
            Label {
                configuration.label
            } icon: {
                HStack {
                    ZStack {

                        if UserDefaults.standard.bool(forKey: "color") {

                            Rectangle()
                                .fill(.yellow)
                                .cornerRadius(50)
                                .frame(width: 70, height: 35)
                        } else {

                            Rectangle()
                                .fill(
                                    configuration.isOn
                                        ? LinearGradient(
                                            gradient: Gradient(
                                                colors: [
                                                    Color(
                                                        Color(
                                                            LSColors().LSColorsGrey
                                                        )
                                                    ),
                                                    Color(
                                                        Color(
                                                            LSColors().LSColorsGrey
                                                        )
                                                    )
                                                ]
                                            ),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                          )
                                        : LinearGradient(
                                            gradient: Gradient(
                                                stops: [
                                                    .init(color: Color(LSColors().LSColorsBlue), location: 0),
                                                    .init(color: Color(LSColors().LSColorsPrimaryBlue), location: 0.6)
                                                ]
                                            ),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                          )
                                )

                                .cornerRadius(50)
                                .frame(width: 70, height: 35)

                        }

                        Circle()
                            .offset(x: configuration.isOn ? 17 : -17)
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)

                    }
                }
            }
        }

        .buttonStyle(PlainButtonStyle())

    }

}

public struct LSSwitchButton: View {
    @State var monToggle: Bool = false
    public var body: some View {

        Toggle(isOn: $monToggle) {

        }
        .toggleStyle(ImageToggleStyle())

    }
}

#Preview {
    LSSwitchButton()
        .modelContainer(for: Item.self, inMemory: true)
}
