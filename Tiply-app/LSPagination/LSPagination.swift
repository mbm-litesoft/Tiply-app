//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI


public struct LSPagination: View {

    public var numberOfPages: Int
    
 @State public var id = 1
    public var body: some View {
        HStack{
            HStack{
                Image("Arrow")
                Text("Page précédente")
            }
            .onTapGesture {
                if id > 1 {
                    id -= 1
                }
            }
            Spacer()
            HStack(){
                if numberOfPages > 7 {
                    ForEach(1...numberOfPages, id: \.self){ number in
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
                    ForEach((numberOfPages - 2)...numberOfPages, id: \.self){ number in
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
                }else{
                    ForEach(1...numberOfPages, id: \.self){ number in
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
            HStack{
                Text("Page suivante")
                Image("Arrow")
                    .rotationEffect(Angle(degrees: 180))
            }
            .onTapGesture {
                if id < numberOfPages {
                    id += 1
                }
            }
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
    LSPagination(numberOfPages: 5)
        .modelContainer(for: Item.self, inMemory: true)
}
