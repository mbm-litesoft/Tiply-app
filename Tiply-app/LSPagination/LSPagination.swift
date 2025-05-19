//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI


public struct LSPagination: View {

    public var count = 100
 @State public var ik = 1
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
                            .foregroundStyle(ik == number ? .white : Color())
                            .background{
                                if ik == number {
                                    Circle()
                                        .fill(Color(LSColors().LSColorsPrimaryBlue))
                                        .frame(width: 20, height: 20)
                                       
                                }
                            }
                            .onTapGesture {
                                ik = number
                            }
                        Spacer()
                    }
                    Text("...")
                    ForEach((count - 2)...count, id: \.self){ number in
                        Spacer()
                        Text("\(number)")
                            .background{
                                if ik == number {
                                    Circle()
                                        .fill(Color(LSColors().LSColorsPrimaryBlue))
                                        .frame(width: 20, height: 20)
                                       
                                }
                            }
                            .onTapGesture {
                                print(number,"nm")
                                ik = number
                            }
                        Spacer()
                    }
                }else{
                    
                    ForEach(1...count, id: \.self){ number in
                        Spacer()
                        Text("\(number)")
                            .background{
                                if ik == number {
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
                                ik = number
                            }
                        Spacer()
                    }
                }
            }
            .foregroundStyle(Color(LSColors().LSColorsPrimaryBlue))
            Spacer()
            Text("Page suivante")
            Image("Arrow")
                .rotationEffect(Angle(degrees: 180))
        }
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
