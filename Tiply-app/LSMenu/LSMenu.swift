//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI

public struct LSMenu: View {
    
    public var items: [String : String]
    
    public var body: some View {

        VStack {
            ForEach(Array(items.sorted(by: { $0.key < $1.key }).enumerated()), id: \.offset) { index, item in
                    Rectangle()
                    .fill(index == 0 ? .clear : .gray)
                        .frame(height: 1)
                        .padding(.horizontal)
                        .offset(y: 3)
                HStack {
                    Text("\(item.key)")
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
                    Text("\(item.value)")
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
                .padding(.bottom, index == items.count - 1 ? 13 : 0)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 3)
                .stroke(
                    .gray,
                    lineWidth: 0.5
                )
        )
        .padding()
    }
}

#Preview {
    LSMenu(items: ["Lorem":"Ipsum", "Lorem2":"Ipsum"])
        .modelContainer(for: Item.self, inMemory: true)
}
