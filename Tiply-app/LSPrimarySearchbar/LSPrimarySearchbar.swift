//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI


public struct LSTextInput: View {

    @State public var textInput: String = ""
    @State public var offsets: [CGFloat] = [25, 0]
    @State public var fontSize: CGFloat = 9
    @FocusState public var isFocused: Bool
    
    public var body: some View {
       
        ZStack{
            ZStack{
                    HStack{
                        Text("Nom")
                            .frame(width: 25)
                            .background(Rectangle().fill(.white))
                            .font(
                                .custom(
                                    "Poppins-Light",
                                    size: fontSize,
                                    relativeTo: .title2
                                )
                            )
                        Spacer()
                        
                    }
            }
            .offset( x: offsets[0] , y:  offsets[1])
            .zIndex(fontSize == 6 ? 1 : 0)
            
            HStack{
                TextField("", text: $textInput)
                    .focused($isFocused)
                    .onChange(of: isFocused, { oldValue, newValue in
                        withAnimation(.easeIn(duration: 0.1)) {
                            fontSize = 6
                            offsets = [20 , -13]
                        }
                    })
                    .padding(8)
                    .padding(.leading, 5)
                    .font(
                        .custom(
                            "Montserrat-semiBold",
                            size: 9,
                            relativeTo: .title2
                        )
                    )
                Spacer()
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
}

#Preview {
    LSTextInput()
        .modelContainer(for: Item.self, inMemory: true)
}
