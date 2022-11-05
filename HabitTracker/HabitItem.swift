//
//  HabitItem.swift
//  HabitTracker
//
//  Created by mitch on 11/1/22.
//  Copyright © 2022 mleers. All rights reserved.
//


import Foundation

struct HabitItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let description: String
    var amount: Int
}
