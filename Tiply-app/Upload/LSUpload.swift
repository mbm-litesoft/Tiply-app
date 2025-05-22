//
//  Untitled.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI
import UniformTypeIdentifiers

// Structure pour représenter un fichier uploadé
struct UploadedFile: Identifiable {
    let id = UUID()
    let name: String
    let size: String
    let url: URL
    let type: String
}

public struct LSUpload: View {
    @State private var uploadedFiles: [UploadedFile] = []
    @State private var showingFilePicker = false
    @State private var showingMoreFiles = false
    @State private var isDragOver = false
    
    private let maxFileSize: Int64 = 10 * 1024 * 1024 // 10MB
    
    public var body: some View {
        VStack {
            dropZoneView
            
            if !uploadedFiles.isEmpty {
                uploadedFilesSection
            }
        }
        .padding(.horizontal, 40)
        .fileImporter(
            isPresented: $showingFilePicker,
            allowedContentTypes: [.item],
            allowsMultipleSelection: true
        ) { result in
            handleFileSelection(result: result)
        }
    }
    
    // MARK: - Sous-vues
    
    private var dropZoneView: some View {
        HStack {
            Spacer()
            VStack {
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .frame(width: 20, height: 25)
                    .padding(.bottom, 20)
                    .foregroundColor(isDragOver ? .blue : .primary)
                
                dropZoneText
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 150)
        .background(isDragOver ? Color.blue.opacity(0.1) : Color.clear)
        .overlay {
            RoundedRectangle(cornerRadius: 2)
                .stroke(
                   Color(LSColors().LSColorsPrimaryBlue),
                    style: StrokeStyle(lineWidth: isDragOver ? 2 : 1.5, dash: [10])
                )
        }
        .onDrop(of: [.fileURL], isTargeted: $isDragOver) { providers in
            handleDrop(providers: providers)
        }
    }
    
    private var dropZoneText: some View {
        VStack {
            HStack(spacing: 5){
                Text("Drag and Drop file here or")
                Text("Choose file")
                    .font(.custom("Montserrat-Bold", size: 10, relativeTo: .title2))
                    .underline()

                    .onTapGesture {
                        showingFilePicker = true
                    }
            }
            
            Text("Taille maximale: 10Mo")
                .padding(.top, 5)
        }
        
        .font(.custom("Montserrat-SemiBold", size: 10, relativeTo: .title2))
    }
    
    private var uploadedFilesSection: some View {
        VStack {
            filesHeader
            filesListView
            
            if uploadedFiles.count > 4 {
                showMoreButton
            }
        }
        .padding(.top)
        .font(.custom("Montserrat-Bold", size: 9, relativeTo: .title2))
    }
    
    private var filesHeader: some View {
        HStack {
            Text("Fichiers uploadés")
                .font(.custom("Montserrat-Bold", size: 12, relativeTo: .title2))
                .padding(.bottom, 5)
            Spacer()
            
            Text("\(uploadedFiles.count) fichier(s)")
                .font(.custom("Montserrat-Light", size: 10, relativeTo: .title2))
                .foregroundColor(.gray)
        }
    }
    
    private var filesListView: some View {
        let displayedFiles = showingMoreFiles ? uploadedFiles : Array(uploadedFiles.prefix(4))
        
        return ForEach(displayedFiles) { file in
            fileRowView(file: file)
        }
    }
    
    private func fileRowView(file: UploadedFile) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(LSColors().LSColorsSecondaryBlue))
                .frame(height: 30)
            
            HStack {
                Image(systemName: iconForFile(file.type))
                    .foregroundStyle(Color(LSColors().LSColorsPrimaryBlue))
                
                Text(file.name)
                    .lineLimit(1)
                    .truncationMode(.middle)
                
                Spacer()
                
                Text(file.size)
                
                Button(action: {
                    removeFile(file)
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                        .font(.system(size: 12))
                }
            }
            .padding(.horizontal, 7)
        }
    }
    
    private var showMoreButton: some View {
        Button(action: {
            showingMoreFiles.toggle()
        }) {
            Text(showingMoreFiles ? "Voir moins..." : "Voir plus...")
                .font(.custom("Montserrat-Bold", size: 9, relativeTo: .title2))
                .foregroundColor(.blue)
        }
        .padding(.top, 5)
    }
    
    // MARK: - Fonctions utilitaires
    
    private func handleDrop(providers: [NSItemProvider]) -> Bool {
        for provider in providers {
            _ = provider.loadObject(ofClass: URL.self) { url, error in
                guard let url = url else { return }
                
                DispatchQueue.main.async {
                    addFile(from: url)
                }
            }
        }
        return true
    }
    
    private func handleFileSelection(result: Result<[URL], Error>) {
        switch result {
        case .success(let urls):
            for url in urls {
                addFile(from: url)
            }
        case .failure(let error):
            print("Erreur lors de la sélection: \(error)")
        }
    }
    
    private func addFile(from url: URL) {
        do {
            // Vérifier si le fichier existe et obtenir ses attributs
            let resourceValues = try url.resourceValues(forKeys: [.fileSizeKey, .contentTypeKey])
            
            guard let fileSize = resourceValues.fileSize else {
                print("Impossible d'obtenir la taille du fichier")
                return
            }
            
            // Vérifier la taille du fichier
            if Int64(fileSize) > maxFileSize {
                print("Fichier trop volumineux: \(fileSize) bytes")
                return
            }
            
            // Éviter les doublons
            if uploadedFiles.contains(where: { $0.name == url.lastPathComponent }) {
                print("Fichier déjà uploadé")
                return
            }
            
            let contentType = resourceValues.contentType?.identifier ?? "unknown"
            
            let newFile = UploadedFile(
                name: url.lastPathComponent,
                size: formatFileSize(fileSize),
                url: url,
                type: contentType
            )
            
            uploadedFiles.append(newFile)
            
        } catch {
            print("Erreur lors de l'ajout du fichier: \(error)")
        }
    }
    
    private func removeFile(_ file: UploadedFile) {
        uploadedFiles.removeAll { $0.id == file.id }
    }
    
    private func formatFileSize(_ size: Int) -> String {
        let formatter = ByteCountFormatter()
        formatter.countStyle = .file
        return formatter.string(fromByteCount: Int64(size))
    }
    
    private func iconForFile(_ type: String) -> String {
        switch type {
        case let t where t.contains("image"):
            return "photo"
        case let t where t.contains("video"):
            return "video"
        case let t where t.contains("audio"):
            return "music.note"
        case let t where t.contains("pdf"):
            return "doc.text"
        case let t where t.contains("text"):
            return "doc.text"
        default:
            return "doc"
        }
    }
}

#Preview {
    LSUpload()
        .modelContainer(for: Item.self, inMemory: true)
}
