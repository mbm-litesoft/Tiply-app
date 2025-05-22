//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI


public struct LSTag: View {

    public var type: Int
    public var title: String
    @State var buttonColor: Color =  Color(LSColors().LSColorsPrimaryBlue)
    public var body: some View {
        
        Text("\(title)")
            .font(.custom("Montserrat-SemiBold", size: 10, relativeTo: .title2))
            .foregroundStyle(
                type != 1 ? Color(LSColors().LSColorsPrimaryBlue ) : .white
            )
            .padding()
            .frame(width: 70, height: 25)
            .background(
                
                RoundedRectangle(cornerRadius: 15)
                    .stroke(
                        type == 2 ? Color(LSColors().LSColorsPrimaryBlue) : Color.clear,
                        lineWidth: 1.5
                    )
                    .fill(buttonColor)
            )
            .onAppear(){
               if type == 2 {
                   buttonColor =  .white
                    
                } else if type == 3{
                    buttonColor =   Color(LSColors().LSColorsSecondaryBlue)
                }
                
            }
    }
}

#Preview {
    LSTag(type: 3, title: "Tag")
        .modelContainer(for: Item.self, inMemory: true)
}
