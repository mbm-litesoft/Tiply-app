//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI


public struct LSCounterVertical: View {

    public var body: some View {
        VStack(spacing: 0){
            Rectangle()
                .fill(Color(LSColors().LSColorsPrimaryBlue))
                .overlay(content: {
                    
                    Text("+")
                        .foregroundStyle(.white)
                })
                .cornerRadius(5, corners: [.topLeft, .topRight])
            Rectangle()
                .fill(Color(LSColors().LSColorsSecondaryBlue))
                .overlay(content: {
                    
                    Text("-")
                        .foregroundStyle(Color(LSColors().LSColorsPrimaryBlue))
                })
                .cornerRadius(5, corners: [.bottomLeft, .bottomRight])
        }
            .frame(width: 20, height: 50)
        
    }
    
}

#Preview {
    LSCounterVertical()
        .modelContainer(for: Item.self, inMemory: true)
}
