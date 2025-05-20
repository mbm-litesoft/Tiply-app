//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI

public struct LSMenu: View {

    public var body: some View {

        VStack {
            ForEach(1...3, id: \.self) { number in
                
                    Rectangle()
                    .fill(number == 1 ? .clear : .gray)
                        .frame(height: 1)
                        .padding(.horizontal)
                        .offset(y: 3)
                
                HStack {
                    Text("Lorem ipsum")

                        .font(
                            .custom(
                                "Montserrat-semiBold",
                                size: 10,
                                relativeTo: .title2
                            )
                        )

                    Spacer()
                }
                .padding(.leading)
                .padding(.top, 5)
                HStack {
                    Text("Lorm ipsum dolor sit amet")
                        .font(
                            .custom(
                                "Poppins-Light",
                                size: 8,
                                relativeTo: .title2
                            )
                        )

                    Spacer()

                }
                .padding(.leading)
                .padding(.bottom, number == 3 ? 13 : 0)
                
             
            }

        }

        .border(Color.gray.opacity(0.5))
        .cornerRadius(2)
        .padding()
    }

}

#Preview {
    LSMenu()
        .modelContainer(for: Item.self, inMemory: true)
}
