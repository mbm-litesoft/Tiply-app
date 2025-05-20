//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI

public struct LSAccordion: View {

    @State public var degrees: Double = 90
    @State public var i = 0
    public var body: some View {

        VStack {
            ForEach(1...3, id: \.self) { number in
                if number != 1 {
                    Rectangle()
                        .fill( .gray)
                        .frame(height: 1)
                        .padding(.horizontal, 7)
                        .offset(y: 9)
                }
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
                        .padding(.trailing)
                    
                }
                .background(.white)
                .padding(.leading, 8)
                .padding(.top, 9)
                .onTapGesture {
                    print("gg")
                    withAnimation(.easeIn(duration: 0.1)) {
                     
                    degrees = -90
                    i = number == i ? 0 : number
                     
                    }
                }
                HStack{
                    if (number == i){
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
                        
                        
                    }
                }
                .padding(.leading, 8)
                .padding(.bottom, number == 3 ? 9 : 0)
                
             
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
    LSAccordion()
        .modelContainer(for: Item.self, inMemory: true)
}
