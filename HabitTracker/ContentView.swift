//
//  ContentView.swift
//  HabitTracker
//
//  Created by mitch on 11/1/22.
//  Copyright © 2022 mleers. All rights reserved.
//


import SwiftUI

struct ContentView: View {
    @StateObject var habits = Habits()

    var body: some View {
        NavigationView {
            List {
                ForEach(habits.items, id: \.name) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button {
                    let habit = HabitItem(name: "Test", description: "Exercise", amount: 5)
                    habits.items.append(habit)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }

    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
