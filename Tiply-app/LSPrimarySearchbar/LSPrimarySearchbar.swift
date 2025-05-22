//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI


public struct LSPrimarySearchbar: View {

    @State public var textInput: String = ""
    
    public var body: some View {
      
        HStack{
            TextField("Rechercher...", text: $textInput)
                .padding(10)
            Spacer()
        }
        .font(.custom("Montserrat-SemiBold", size: 9, relativeTo: .title2))
        .foregroundStyle(.black.opacity(0.6))
        .background(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.black, lineWidth: 0.5)
                .fill(.white)
           
        )
        .overlay(
            HStack{
                Spacer()
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundStyle(Color(LSColors().LSColorsPrimaryBlue))
                    .padding(.trailing,9)
                    .onTapGesture {
                        textInput = ""
                    }
            }
            
          
        )
        .padding()
        
    }
}

public struct LSSecondarySearchbar: View {

    
    public var body: some View {
      
        HStack{
            Text("Rechercher...")
                .padding(10)
            Spacer()
        }
        .font(.custom("Montserrat-SemiBold", size: 9, relativeTo: .title2))
        .foregroundStyle(.black.opacity(0.6))
        .padding()
        
    }
}

#Preview {
    LSPrimarySearchbar()
        .modelContainer(for: Item.self, inMemory: true)
    
    LSSecondarySearchbar()
}
