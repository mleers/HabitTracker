//
//  Habits.swift
//  HabitTracker
//
//  Created by mitch on 11/1/22.
//  Copyright © 2022 mleers. All rights reserved.
//


import Foundation

class Habits: ObservableObject {
    @Published var items = [HabitItem]() {
        didSet {
            let encode = JSONEncoder()

            if let encoded = try? encode.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }

    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([HabitItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
}
