//
//  Colors.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import SwiftUI


public struct LSMenu: View {

    public var body: some View {
      
        VStack{
            ForEach(1...3, id: .\self){ _ in
                HStack(){
                    Text("Lorem ipsum")
                    Text("Lorm ipsum dolor sit amet")
                }
            }
        }
    }
    
}




#Preview {
    LSMenu()
        .modelContainer(for: Item.self, inMemory: true)
}
