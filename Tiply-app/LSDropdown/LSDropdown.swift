//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI

public struct LSDropdown: View {
    public var items: [String: String]
    @State public var degrees: Double = 90
    @State public var i = -1
    public var body: some View {

        VStack {
            ForEach(
                Array(items.enumerated()),
                id: \.0
            ) { index, item in
                VStack {
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
                        Image("Arrow")
                            .resizable()
                            .frame(width: 6, height: 9)
                            .rotationEffect(
                                Angle(degrees: index == i ? degrees : 90)
                            )
                    }
                    .background(.white)
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.1)) {
                            degrees = -90
                            i = index == i ? -1 : index
                        }
                    }
                    HStack {
                        if index == i {
                            VStack {
                                Rectangle()
                                    .fill(.gray)
                                    .frame(height: 1)

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
                                .padding(.top, 1)
                            }
                        }
                    }
                }
                .padding(9)
            }
            .background(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(
                        .gray,
                        lineWidth: 0.5
                    )
            )
        }
        .padding()
    }
}

#Preview {
    LSDropdown(items: ["Apple": "Banana", "Orange": "Coconut"])
        .modelContainer(for: Item.self, inMemory: true)
}
