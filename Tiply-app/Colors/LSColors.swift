//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI

public struct LSColors {

    public let LSColorsWhite = #colorLiteral(
        red: 1,
        green: 1,
        blue: 1,
        alpha: 1
    )
    public let LSColorsBlue = #colorLiteral(
        red: 0,
        green: 0.6763487458,
        blue: 1,
        alpha: 1
    )
    public let LSColorsSecondaryBlue = #colorLiteral(
        red: 0.9215686275,
        green: 0.9176470588,
        blue: 1,
        alpha: 1
    )
    public let LSColorsPrimaryBlue = #colorLiteral(
        red: 0.1803921569,
        green: 0.1333333333,
        blue: 0.9921568627,
        alpha: 1
    )
    public let LSColorsRed = #colorLiteral(
        red: 1,
        green: 0.4039215686,
        blue: 0.4039215686,
        alpha: 1
    )
    public let LSColorsPrimaryGreen = #colorLiteral(red: 0.1215686275, green: 0.862745098, blue: 0.662745098, alpha: 1)
    
    public let LSColorsSecondaryGreen = #colorLiteral(
        red: 0.7215686275,
        green: 0.9647058824,
        blue: 0.8980392157,
        alpha: 1
    )
    public let LSColorsDarkGrey = #colorLiteral(
        red: 0.2509803922,
        green: 0.2509803922,
        blue: 0.2509803922,
        alpha: 1
    )
    public let LSColorsGrey = #colorLiteral(
        red: 0.8784313725,
        green: 0.8784313725,
        blue: 0.8784313725,
        alpha: 1
    )
    public let LSColorsLightGrey = #colorLiteral(
        red: 0.9764705882,
        green: 0.9764705882,
        blue: 0.9882352941,
        alpha: 1
    )
   
    // non identique à la maquette
    public let LSColorsBlueGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 0/255, green: 215/255, blue: 253/255), // #00D7FD
            Color(red: 0/255, green: 38/255, blue: 255/255)   // #0026FF
        ]),
        startPoint: .leading,
        endPoint: .trailing
    )


}
