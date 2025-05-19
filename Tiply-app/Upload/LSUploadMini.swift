
//
//  Untitled.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//
import SwiftUI

public struct LSUploadMini: View {
    public var body: some View {
        VStack{
            
            HStack(){
                Button(){
                    
                    
                } label: {
                    
                    Text("Parcourir...")
                        .foregroundStyle(Color(LSColors().LSColorsPrimaryBlue))
                        .padding(5)
                        .background(
                            
                            RoundedRectangle(cornerRadius: 2)
                                .stroke(
                                    Color(LSColors().LSColorsPrimaryBlue),
                                    lineWidth: 1
                                )
                                .fill( Color(LSColors().LSColorsSecondaryBlue))
                            
                        )
                }
                
                Text("Aucun fichier séléctionné")
                    .padding(.leading, 5)
                Spacer()
            }
            
            
            HStack{
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 4, height: 4)
                    .padding(4)
                    .foregroundStyle( Color(LSColors().LSColorsWhite))
                    .background(
                        RoundedRectangle(cornerRadius: 2)
                            .fill( Color(LSColors().LSColorsRed))
                        )
                Text("Format de fichier non supporté")
                    .foregroundStyle( Color(LSColors().LSColorsRed))
                Spacer()
            }
            
        }
        .padding(.leading)
        .font(.custom("Montserrat-Bold", size: 10, relativeTo: .title2))
    }
}

#Preview {
    LSUploadMini()
        .modelContainer(for: Item.self, inMemory: true)
}
