//
//  ListRowView.swift
//  Just Do It
//
//  Created by Steven on 3/16/23.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }

        .font(.system(.title2, design: .rounded))
        .padding(.vertical, 5)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "Item1", isCompleted: false)
    static var item2 = ItemModel(title: "Item2", isCompleted: true)
    static var item3 = ItemModel(title: "Item3", isCompleted: true)
    static var item4 = ItemModel(title: "Item4", isCompleted: false)

    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
            ListRowView(item: item3)
            ListRowView(item: item4)
        }
        .previewLayout(.sizeThatFits)
    }
}
