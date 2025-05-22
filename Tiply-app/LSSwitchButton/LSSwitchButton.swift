//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI

struct SwitchToggleButtonStyle: ToggleStyle {

    public var options: [String: String]
    
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
                            Rectangle()
                                .fill(
                                    Color(LSColors().LSColorsSecondaryBlue)
                                )
                                .cornerRadius(50)
                                .frame(width: 200, height: 35)
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                Color(LSColors().LSColorsPrimaryBlue)
                            )
                            .offset(x: configuration.isOn ? 48 : -48)
                            .foregroundColor(.white)
                            .frame(width: 100, height: 32)
                        HStack (spacing: 50){
                            Text("\(options.first?.key ?? "Default")")
                                .foregroundStyle( configuration.isOn
                                    ? Color(LSColors().LSColorsPrimaryBlue)  : Color(
                                        LSColors().LSColorsSecondaryBlue
                                    )
                                )
                            Text("\(options.first?.value ?? "Default")")
                                .foregroundStyle( !configuration.isOn
                                    ? Color(LSColors().LSColorsPrimaryBlue)  : Color(
                                        LSColors().LSColorsSecondaryBlue
                                    )
                                )
                                .offset(x: -7)
                        }
                        .font(
                            .custom(
                                "Montserrat-semiBold",
                                size: 10,
                                relativeTo: .title2
                            )
                        )
                    }
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

public struct LSSwitchButton: View {
    @State var monToggle: Bool = false
    public var options: [String: String]
    public var body: some View {
        Toggle(isOn: $monToggle) {
        }
        .toggleStyle(SwitchToggleButtonStyle(options: options))
    }
}

#Preview {
    LSSwitchButton(options: ["indinviduels" : "Partagés"])
        .modelContainer(for: Item.self, inMemory: true)
}
