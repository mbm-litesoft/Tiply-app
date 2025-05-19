//
//  Untitled.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//
import SwiftUI

public struct LSUpload: View {
    public var body: some View {
        VStack{
            HStack {
                Spacer()
                VStack{
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .frame(width: 20, height: 25)
                        .padding(.bottom, 20)
                    
                    VStack {
                        Text("Drag and Drop file here or ")
                        + Text("Choose file")
                            .font(
                                .custom(
                                    "Montserrat-Bold",
                                    size: 10,
                                    relativeTo: .title2
                                )
                            )
                            .underline()
                        Text("Taille maximale: 10Mo")
                            .padding(.top, 5)
                    }
                    .font(
                        .custom(
                            "Montserrat-SemiBold",
                            size: 10,
                            relativeTo: .title2
                        )
                    )
                }
                Spacer()
            }
            .frame(width: .infinity,  height: 150)
            .overlay {
                RoundedRectangle(cornerRadius: 2)
                    .stroke(
                        Color(LSColors().LSColorsPrimaryBlue),
                        style: StrokeStyle(lineWidth: 1.5, dash: [10])
                    )
                
            }
            
            VStack {
                HStack {
                    Text("Fichiers uploadés")
                        .font(
                            .custom(
                                "Montserrat-Bold",
                                size: 12,
                                relativeTo: .title2
                            )
                        )
                        .padding(.bottom, 5)
                    Spacer()
                }
                ForEach(1...4, id: \.self){_ in
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color(LSColors().LSColorsSecondaryBlue))
                            .frame(height: 30)
                        
                        
                        HStack {
                            Image(systemName: "photo")
                                .resizable()
                                .frame(width: 20, height: 15)
                                .foregroundStyle(Color(LSColors().LSColorsPrimaryBlue))
                                
                            Text("Image.png")
                            Spacer()
                            Text("10Mo")
                            
                        }
                        .padding(.horizontal, 7)
                    }
                    
                    
                    
                }
                Text("Voir plus...")
                    .padding(.top, 5)
            }
            .padding(.top)
            .font(
                .custom(
                    "Montserrat-Bold",
                    size: 9,
                    relativeTo: .title2
                )
            )
        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    LSUpload()
        .modelContainer(for: Item.self, inMemory: true)
}
