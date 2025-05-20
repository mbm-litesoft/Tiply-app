//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI

public struct LSStepper: View {

    public var body: some View {

        VStack (alignment: .leading){
            
            Text("Etape 3 sur 4")
                .font(
                    .custom(
                        "Poppins-Light",
                        size: 9,
                        relativeTo: .title2
                    )
                )
            Text("Titre de l'étape")
                .font(
                    .custom(
                        "Montserrat-Bold",
                        size: 18,
                        relativeTo: .title2
                    )
                )
            HStack(spacing: 5){
                ForEach(0..<4) { index in
                    RoundedRectangle(cornerRadius: 3)
                        .fill(
                            index < 3 ? Color(LSColors().LSColorsPrimaryBlue) : Color(
                                LSColors().LSColorsSecondaryBlue
                            )
                        )
                }
            }.frame(height: 12)
        }
        .padding(.horizontal,20)
    }

}

#Preview {
    LSStepper()
        .modelContainer(for: Item.self, inMemory: true)
}
