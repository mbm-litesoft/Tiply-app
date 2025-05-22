//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI


public struct LSTextInput: View {

    @State public var textInput: String
    public var providedRegex: String
    @State public var offsets: [CGFloat] = [25, 0]
    @State public var fontSize: CGFloat = 9
    @FocusState public var isFocused: Bool
    @State public var borderColor: Color = .gray
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
                        borderColor =   Color(LSColors().LSColorsPrimaryBlue)
                        withAnimation(.easeIn(duration: 0.1)) {
                            
                            fontSize = 6
                            offsets = [20 , -13]
                        }
                    })
                    .onChange(of: textInput, { oldValue, newValue in
                      
                        if textInput.count > 0 {
                            
                            
                            do {
                                let regex = try NSRegularExpression(pattern: providedRegex)
                                let range = NSRange(textInput.startIndex..<textInput.endIndex, in: textInput)
                                
                                if regex.firstMatch(in: textInput, options: [], range: range) != nil {
                                    borderColor = Color.green
                                } else {
                                    borderColor = Color(LSColors().LSColorsRed)
                                }
                            } catch {
                                borderColor = Color(LSColors().LSColorsRed)
                            }
                        }else{
                            borderColor = Color(LSColors().LSColorsRed)
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
                        borderColor,
                        lineWidth: 0.7
                    )
            )
            .padding()
        }
        .onAppear(){
            if !textInput.isEmpty{
                fontSize = 6
                offsets = [20 , -13]
            }
        }
    }
}

#Preview {
    LSTextInput(textInput: "Dauphin", providedRegex: #"^[A-Za-z]{1,}$"#)
        .modelContainer(for: Item.self, inMemory: true)
}
