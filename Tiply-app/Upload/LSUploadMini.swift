//
//  Untitled.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI
import UniformTypeIdentifiers

public struct LSUploadMini: View {
    // MARK: - Paramètres configurables
    let allowedFileTypes: [UTType]
    let maxFileSize: Int64
    let onFileSelected: ((URL) -> Void)?
    let onFileRemoved: (() -> Void)?
    
    // MARK: - États internes
    @State private var selectedFile: URL?
    @State private var showingFilePicker = false
    @State private var errorMessage: String?
    @State private var showError = false
    
    // MARK: - Initialiseurs
    public init(
        allowedFileTypes: [UTType] = [.image, .pdf, .text],
        maxFileSize: Int64 = 10 * 1024 * 1024, // 10MB par défaut
        onFileSelected: ((URL) -> Void)? = nil,
        onFileRemoved: (() -> Void)? = nil
    ) {
        self.allowedFileTypes = allowedFileTypes
        self.maxFileSize = maxFileSize
        self.onFileSelected = onFileSelected
        self.onFileRemoved = onFileRemoved
    }
    
    // Initialiseur avec extensions de fichiers (plus simple à utiliser)
    public init(
        allowedExtensions: [String], // ["jpg", "png", "pdf"]
        maxFileSize: Int64 = 10 * 1024 * 1024,
        onFileSelected: ((URL) -> Void)? = nil,
        onFileRemoved: (() -> Void)? = nil
    ) {
        self.allowedFileTypes = allowedExtensions.compactMap { ext in
            UTType(filenameExtension: ext)
        }
        self.maxFileSize = maxFileSize
        self.onFileSelected = onFileSelected
        self.onFileRemoved = onFileRemoved
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            fileSelectionRow
            
            if showError, let errorMessage = errorMessage {
                errorRow(message: errorMessage)
            }
        }
        .padding(.leading)
        .font(.custom("Montserrat-Bold", size: 10, relativeTo: .title2))
        .fileImporter(
            isPresented: $showingFilePicker,
            allowedContentTypes: allowedFileTypes,
            allowsMultipleSelection: false
        ) { result in
            handleFileSelection(result: result)
        }
    }
    
    // MARK: - Sous-vues
    
    private var fileSelectionRow: some View {
        HStack {
            Button {
                showingFilePicker = true
            } label: {
                Text("Parcourir...")
                    .foregroundStyle(Color(LSColors().LSColorsPrimaryBlue))
                    .padding(5)
                    .background(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color(LSColors().LSColorsPrimaryBlue), lineWidth: 1)
                            .fill(Color(LSColors().LSColorsSecondaryBlue))
                    )
            }
            
            HStack {
                Text(fileStatusText)
                    .padding(.leading, 5)
                    .lineLimit(1)
                    .truncationMode(.middle)
                    .foregroundColor(selectedFile != nil ? .primary : .gray)
                
                if selectedFile != nil {
                    Button {
                        removeFile()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                            .font(.system(size: 12))
                    }
                }
            }
            
            Spacer()
        }
    }
    
    private func errorRow(message: String) -> some View {
        HStack {
            Image(systemName: "xmark")
                .resizable()
                .frame(width: 4, height: 4)
                .padding(4)
                .foregroundStyle(Color(LSColors().LSColorsWhite))
                .background(
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color(LSColors().LSColorsRed))
                )
            
            Text(message)
                .foregroundStyle(Color(LSColors().LSColorsRed))
            
            Spacer()
        }
    }
    
    // MARK: - Propriétés calculées
    
    private var fileStatusText: String {
        if let selectedFile = selectedFile {
            return selectedFile.lastPathComponent
        } else {
            return "Aucun fichier sélectionné"
        }
    }
    
    private var allowedExtensionsText: String {
        let extensions = allowedFileTypes.compactMap { $0.preferredFilenameExtension }
        return extensions.joined(separator: ", ").uppercased()
    }
    
    // MARK: - Fonctions utilitaires
    
    private func handleFileSelection(result: Result<[URL], Error>) {
        switch result {
        case .success(let urls):
            guard let url = urls.first else { return }
            validateAndSelectFile(url)
            
        case .failure(let error):
            showErrorMessage("Erreur lors de la sélection: \(error.localizedDescription)")
        }
    }
    
    private func validateAndSelectFile(_ url: URL) {
        // Vérifier l'extension
        let fileExtension = url.pathExtension.lowercased()
        let allowedExtensions = allowedFileTypes.compactMap { $0.preferredFilenameExtension }
        
        guard allowedExtensions.contains(fileExtension) else {
            showErrorMessage("Format de fichier non supporté. Formats acceptés: \(allowedExtensionsText)")
            return
        }
        
        // Vérifier la taille
        do {
            let resourceValues = try url.resourceValues(forKeys: [.fileSizeKey])
            if let fileSize = resourceValues.fileSize, Int64(fileSize) > maxFileSize {
                let maxSizeFormatted = ByteCountFormatter().string(fromByteCount: maxFileSize)
                showErrorMessage("Fichier trop volumineux. Taille maximale: \(maxSizeFormatted)")
                return
            }
        } catch {
            showErrorMessage("Impossible de vérifier la taille du fichier")
            return
        }
        
        // Fichier valide
        selectedFile = url
        hideError()
        onFileSelected?(url)
    }
    
    private func removeFile() {
        selectedFile = nil
        hideError()
        onFileRemoved?()
    }
    
    private func showErrorMessage(_ message: String) {
        errorMessage = message
        showError = true
        
        // Masquer l'erreur automatiquement après 5 secondes
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            hideError()
        }
    }
    
    private func hideError() {
        withAnimation(.easeInOut(duration: 0.3)) {
            showError = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            errorMessage = nil
        }
    }
}

// MARK: - Extensions pour faciliter l'usage

extension LSUploadMini {
    // Initialiseur pour les images uniquement
    public static func imagesOnly(
        maxFileSize: Int64 = 10 * 1024 * 1024,
        onFileSelected: ((URL) -> Void)? = nil,
        onFileRemoved: (() -> Void)? = nil
    ) -> LSUploadMini {
        return LSUploadMini(
            allowedFileTypes: [.image],
            maxFileSize: maxFileSize,
            onFileSelected: onFileSelected,
            onFileRemoved: onFileRemoved
        )
    }
    
    // Initialiseur pour les documents
    public static func documentsOnly(
        maxFileSize: Int64 = 10 * 1024 * 1024,
        onFileSelected: ((URL) -> Void)? = nil,
        onFileRemoved: (() -> Void)? = nil
    ) -> LSUploadMini {
        return LSUploadMini(
            allowedFileTypes: [.pdf, .text, .rtf],
            maxFileSize: maxFileSize,
            onFileSelected: onFileSelected,
            onFileRemoved: onFileRemoved
        )
    }
}

#Preview {
    VStack(spacing: 20) {
        Text("Upload avec formats personnalisés")
            .font(.headline)
        
        // Exemple avec extensions personnalisées
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
    .padding()
    .modelContainer(for: Item.self, inMemory: true)
}
