//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI


public struct LSConnect: View {


    public var body: some View {
        VStack{
            LSPrimaryButton(
                buttonLabel: "Continuer",
                buttonColor: Color(LSColors().LSColorsPrimaryBlue),
                isBlue: true
            )
            Text("Changer de compte")
                .font(
                    .custom(
                        "Poppins-light",
                        size: 7,
                        relativeTo: .title2
                    )
                )
                .underline()
        }
        
    }
    
}


public struct LSConnectSignUp: View {
    public var body: some View {
        HStack{
            Text("Vous n'avez pas de compte ? ")
            + Text("Créer un compte")
                .font(
                    .custom(
                        "Poppins-SemiBold",
                        size: 7,
                        relativeTo: .title2
                    )
                )
        }
            .font(
                .custom(
                    "Poppins-Light",
                    size: 7,
                    relativeTo: .title2
                )
            )
           
    }
}

#Preview {
    LSConnectSignUp()
        .modelContainer(for: Item.self, inMemory: true)
}
