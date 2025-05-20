//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI

public struct LSDropdown: View {

    @State public var degrees: Double = 90
    @State public var i = 0
    public var body: some View {

        VStack {
            ForEach(1...3, id: \.self) { number in
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
                        Image("Arrow")
                            .resizable()
                            .frame(width: 6, height: 9)
                            .rotationEffect(Angle(degrees: number == i ? degrees : 90))
                        
                        
                    }
                    .background(.white)
                    
                    .onTapGesture {
                        print("gg")
                        withAnimation(.easeIn(duration: 0.1)) {
                            
                            degrees = -90
                            i = number == i ? 0 : number
                            
                        }
                    }
                    HStack{
                        if (number == i){
                            VStack{
                                Rectangle()
                                    .fill( .gray)
                                    .frame(height: 1)
                                   
                                
                                
                                HStack {
                                    Text("Lorm ipsum dolor sit amet")
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
    LSDropdown()
        .modelContainer(for: Item.self, inMemory: true)
}
