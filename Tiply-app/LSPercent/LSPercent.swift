//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI

public struct LSPercent: View {

    public var body: some View {

        RoundedRectangle(cornerRadius: 4)
            .fill(Color(LSColors().LSColorsSecondaryBlue))
            .frame(width: 60, height: 30)
            .overlay {
                Text("00.00 %")
                    .font(
                        .custom(
                            "Poppins-SemiBold",
                            size: 10,
                            relativeTo: .title2
                        )
                    )
                    .foregroundStyle(Color(LSColors().LSColorsPrimaryBlue))
            }
    }
}

#Preview {
    LSPercent()
        .modelContainer(for: Item.self, inMemory: true)
}
