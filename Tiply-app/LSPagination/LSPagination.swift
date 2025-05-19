//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI


public struct LSPagination: View {

    public var count = 100
 @State public var id = 1
    public var body: some View {
        HStack{
            
            Image("Arrow")
            Text("Page précédente")
            Spacer()
            HStack(){
                
                if count > 7 {
                    
                    ForEach(1...3, id: \.self){ number in
                        Spacer()
                        Text("\(number)")
                            .foregroundStyle(id == number ? .white : Color(LSColors().LSColorsPrimaryBlue))
                            .background{
                                if id == number {
                                    Circle()
                                        .fill(Color(LSColors().LSColorsPrimaryBlue))
                                        .frame(width: 20, height: 20)
                                       
                                }
                            }
                            .onTapGesture {
                                id = number
                            }
                        Spacer()
                    }
                    Spacer()
                    Text("...")
                        .foregroundStyle(Color(LSColors().LSColorsPrimaryBlue))
                    Spacer()
                    ForEach((count - 2)...count, id: \.self){ number in
                        Spacer()
                        Text("\(number)")
                            .foregroundStyle(id == number ? .white : Color(LSColors().LSColorsPrimaryBlue))
                            .background{
                                if id == number {
                                    Circle()
                                        .fill(Color(LSColors().LSColorsPrimaryBlue))
                                        .frame(width: 20, height: 20)
                                       
                                }
                            }
                            .onTapGesture {
                                print(number,"nm")
                                id = number
                            }
                        Spacer()
                    }
                }else{
                    
                    ForEach(1...count, id: \.self){ number in
                        Spacer()
                        Text("\(number)")
                            .foregroundStyle(id == number ? .white : Color(LSColors().LSColorsPrimaryBlue))
                            .background{
                                if id == number {
                                    Circle()
                                        .fill(
                                            Color(
                                                LSColors().LSColorsPrimaryBlue
                                            )
                                        )
                                        .frame(width: 20, height: 20)
                                       
                                }
                            }
                            .onTapGesture {
                                id = number
                            }
                        Spacer()
                    }
                }
            }
           
            Spacer()
            Text("Page suivante")
            Image("Arrow")
                .rotationEffect(Angle(degrees: 180))
        }
        .padding(.horizontal, 30)
        .font(
            .custom(
                "Poppins-SemiBold",
                size: 7,
                relativeTo: .title2
            )
        )
    }
    
}




#Preview {
    LSPagination()
        .modelContainer(for: Item.self, inMemory: true)
}
