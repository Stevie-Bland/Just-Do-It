//
//  ItemModel.swift
//  Just Do It
//
//  Created by Steven on 3/16/23.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init (title: String, isCompleted: Bool) {
        self.id = UUID().uuidString
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel( title: title, isCompleted: !isCompleted)
    }
}


