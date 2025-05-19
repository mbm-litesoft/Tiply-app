//
//  Item.swift
//  Tiply-app
//
//  Created by Ben moussa on 19/05/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
