//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI

public struct LSList: View {

    public var body: some View {

        VStack {
            ForEach(1...3, id: \.self) { number in
                
                    Rectangle()
                    .fill(number == 1 ? .clear : .gray)
                        .frame(height: 1)
                        .padding(.horizontal, 8)
                        .offset(y: 3)
                
                HStack{
                  
                    Circle()
                        .fill(Color(LSColors().LSColorsPrimaryBlue))
                        .frame(width: 11, height: 11)
                        .overlay {
                            Image(systemName:"clock.arrow.trianglehead.counterclockwise.rotate.90")
                                .resizable()
                                .frame(width: 5 , height: 5)
                                .scaledToFit()
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, number == 3 ? 13 : 0)
                        .offset(x: 10, y: 2)
                       
                    
                    VStack{
                        HStack {
                            
                            
                            
                            
                            Text("Lorem ipsum")
                            
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
                        .padding(.bottom, number == 3 ? 13 : 0)
                    }
                    .offset(x: -5)
                }
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
    LSList()
        .modelContainer(for: Item.self, inMemory: true)
}
