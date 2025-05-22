//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI

public struct LSPercent: View {

    public var number: Double
        
    
    
    public var body: some View {

        RoundedRectangle(cornerRadius: 4)
            .fill(Color(LSColors().LSColorsSecondaryBlue))
            .frame(width: 60, height: 30)
            .overlay {
                Text("\(number, specifier: "%.2f")%")
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
    LSPercent(number: 0.10)
        .modelContainer(for: Item.self, inMemory: true)
}
