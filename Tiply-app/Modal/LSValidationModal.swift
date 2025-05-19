//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI


public struct LSValidationModal: View {

    public var modalTitle: String
    public var modalText: String

    public var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {

                } label: {

                    ZStack {
                        Rectangle()
                            .fill(
                                Color.red
                            )
                            .cornerRadius(
                                7,
                                corners: .bottomLeft
                            )
                        Image(
                            systemName: "xmark"
                        )
                        .resizable()
                        .frame(width: 7, height: 7)
                        .foregroundColor(
                            .white
                        )
                    }
                    .frame(width: 22, height: 22)
                }
            }

            VStack {

                Text(
                    "Lorem ipsum"
                )
                .font(
                    .custom(
                        "Montserrat-Bold",
                        size: 14,
                        relativeTo: .title2
                    )
                )
                Text(
                    "Lorm ipsum dolor sit amet, consectetur adipiscing elit. Phasellus suscipit purus eget"
                )
                .frame(width: 160)
                .padding(.vertical, 1)
                .font(
                    .custom("Poppins-Light", size: 10, relativeTo: .title2)
                )

                LSPrimaryRoundButton(
                    buttonText: "Valider",
                    buttonColor: Color(LSColors().LSColorsPrimaryBlue),
                    isBlue: true
                )
                    .padding(.top)
                    .padding(.bottom, 7)
                
                
                LSSecondaryRoundButton(
                buttonText: "Continuer",
                buttonColor: Color(LSColors().LSColorsPrimaryBlue)
                )
            }
            .multilineTextAlignment(
                .center
            )
        }
        .frame(width: 210)
        .background(Color.white)
        .cornerRadius(7)
        .shadow(color: .gray.opacity(0.4), radius: 3, x: 0, y: 0)

    }
}
