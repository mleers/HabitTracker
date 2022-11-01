//
//  Habits.swift
//  HabitTracker
//
//  Created by mitch on 11/1/22.
//  Copyright © 2022 mleers. All rights reserved.
//


import Foundation

class Habits: ObservableObject {
    @Published var items = [HabitItem]()
}
