//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI

public struct LSStepper: View {
    
    public var titleOfState : String
    public var actualState : Int
    public var numberOfState : Int
    public var body: some View {

        VStack (alignment: .leading){
            Text("Etape \(actualState) sur \(numberOfState)")
                .font(
                    .custom(
                        "Poppins-Light",
                        size: 9,
                        relativeTo: .title2
                    )
                )
            Text("\(titleOfState)")
                .font(
                    .custom(
                        "Montserrat-Bold",
                        size: 18,
                        relativeTo: .title2
                    )
                )
            HStack(spacing: 5){
                ForEach(0..<numberOfState, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 3)
                        .fill(
                            index < actualState ? Color(LSColors().LSColorsPrimaryBlue) : Color(
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
    LSStepper(titleOfState: "Achat" ,actualState: 3 , numberOfState: 5)
        .modelContainer(for: Item.self, inMemory: true)
}
