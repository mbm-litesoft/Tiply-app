//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI

public struct LSCounterHorizontal: View {
   @State public var counter : Int
    public var type : Int
    
    public var body: some View {
        if type == 1 {
            HStack {
                
                Rectangle()
                    .fill(Color(LSColors().LSColorsSecondaryBlue))
                    .overlay(content: {
                        
                        Text("-")
                            .foregroundStyle(Color(LSColors().LSColorsPrimaryBlue))
                    })
                    .cornerRadius(5, corners: [.topLeft, .bottomLeft])
                    .frame(width: 25, height: 25)
                    .onTapGesture {
                        if counter > 0 {
                            counter -= 1
                        }
                    }
                Spacer()
                HStack {
                    Text("\(counter)")
                    + Text(" unité")
                }
                .font(.custom("Montserrat-SemiBold", size: 10, relativeTo: .title2))
                
                Spacer()
                
                Rectangle()
                    .fill(Color(LSColors().LSColorsPrimaryBlue))
                    .overlay(content: {
                        
                        Text("+")
                            .foregroundStyle(.white)
                    })
                    .cornerRadius(5, corners: [.topRight, .bottomRight])
                    .frame(width: 25, height: 25)
                    .onTapGesture {
                        counter += 1
                    }
                
            }
            .frame(width: 110, height: 25)
        } else {
            
        
        
        HStack(spacing: 0){
            Rectangle()
                .fill(Color(LSColors().LSColorsPrimaryBlue))
                .overlay(content: {
                    
                    Text("+")
                        .foregroundStyle(.white)
                })
                .cornerRadius(5, corners: [.topLeft, .bottomLeft])
            
            Rectangle()
                .fill(Color(LSColors().LSColorsSecondaryBlue))
                .overlay(content: {
                    
                    Text("-")
                        .foregroundStyle(Color(LSColors().LSColorsPrimaryBlue))
                })
                .cornerRadius(5, corners: [.topRight, .bottomRight])
        }
        .frame(width: 70, height: 25)
        }
    }
    

    

}

#Preview {
    LSCounterHorizontal(counter: 0 ,type: 1)
        .modelContainer(for: Item.self, inMemory: true)
}
