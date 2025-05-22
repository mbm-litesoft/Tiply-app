//
//  ContentView.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftData
import SwiftUI


// rajout la possibilité de modifier un seul coin avec cornerRadius
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}


struct ContentView: View {
    public var body: some View {
        Text("Upload avec formats personnalisés")
            .font(.headline)
        LSUploadMini(
            allowedExtensions: ["jpg", "png", "gif"],
            maxFileSize: 5 * 1024 * 1024 // 5MB
        ) { url in
            print("Fichier sélectionné: \(url.lastPathComponent)")
        } onFileRemoved: {
            print("Fichier supprimé")
        }
        
        Divider()
        
        Text("Upload images uniquement")
            .font(.headline)
        
        // Exemple pour images uniquement
        LSUploadMini.imagesOnly { url in
            print("Image sélectionnée: \(url.lastPathComponent)")
        }
        
        Divider()
        
        Text("Upload documents uniquement")
            .font(.headline)
        
        // Exemple pour documents uniquement
        LSUploadMini.documentsOnly { url in
            print("Document sélectionné: \(url.lastPathComponent)")
        }
    }
}

