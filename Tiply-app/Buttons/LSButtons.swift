//
//  Untitled.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//
import SwiftUI

public struct LSPrimaryRoundButton: View {
    
    public var buttonText: String
    public var buttonColor: Color
    public var isBlue: Bool
    
    public var body: some View {

        Text(buttonText)
            .font(.custom("Montserrat-Bold", size: 8, relativeTo: .title2))
            .foregroundColor(isBlue ? .white : .black)
            .padding()
            .frame(width: 100, height: 20)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.clear, lineWidth: 0.5)
                    .fill(buttonColor)
            )
    }
}

public struct LSPrimaryButton: View {
    
    public var buttonText: String
    public var buttonColor: Color
    public var isBlue: Bool
    
    public var body: some View {

        Text(buttonText)
            .font(.custom("Montserrat-Bold", size: 8, relativeTo: .title2))
            .foregroundColor(isBlue ? .white : .black)
            .padding()
            .frame(width: 180, height: 20)
            .background(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(Color.clear, lineWidth: 0.5)
                    .fill(buttonColor)
            )
    }
}

public struct LSSecondaryButton: View {

    public var buttonText: String
    public var buttonColor: Color

    public var body: some View {

        Text(buttonText)
            .font(.custom("Montserrat-Bold", size: 8, relativeTo: .title2))
            .foregroundColor(Color(LSColors().LSColorsPrimaryBlue), )
            .padding()
            .frame(width: 170, height: 20)
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .stroke(
                        Color(LSColors().LSColorsPrimaryBlue),
                        lineWidth: 0.5
                    )
            )
    }
}

public struct LSSecondaryRoundButton: View {

    public var buttonText: String
    public var buttonColor: Color

    public var body: some View {
        Text(buttonText)
            .font(.custom("Montserrat-Bold", size: 8, relativeTo: .title2))
            .foregroundColor(Color(LSColors().LSColorsPrimaryBlue), )
            .padding()
            .frame(width: 100, height: 20)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(
                        Color(LSColors().LSColorsPrimaryBlue),
                        lineWidth: 0.5
                    )
            )
    }
}
