//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI

public struct LSAccordion: View {
    public var items: [String: String]
    @State public var degrees: Double = 90
    @State public var i = -1
    
    public var body: some View {

        VStack {
            ForEach(
                Array(items.enumerated()),
                id: \.0
            ) { index, item in
                if index != 0 {
                    Rectangle()
                        .fill(.gray)
                        .frame(height: 1)
                        .padding(.horizontal, 7)
                        .offset(y: 9)
                }
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
                        .padding(.trailing)
                }
                .background(.white)
                .padding(.leading, 8)
                .padding(.top, 9)
                .onTapGesture {
                    withAnimation(.easeIn(duration: 0.1)) {
                        degrees = -90
                        i = index == i ? -1 : index
                    }
                }
                HStack {
                    if index == i {
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
                    }
                }
                .padding(.leading, 8)
                .padding(.bottom, index == items.count - 1 ? 10 : 0)
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
    LSAccordion(items: ["Apple": "Banana", "Orange": "Coconut"])
        .modelContainer(for: Item.self, inMemory: true)
}
