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
    @State private var showingAddHabit = false

    var body: some View {
        NavigationView {
            List {
                ForEach($habits.items) { $habit in
                    NavigationLink {
                        HabitView(habit: $habit)
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(habit.name)
                                    .font(.headline)
                                Text(habit.description)
                            }

                            Spacer()

                            Text(habit.amount, format: .number)
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button {
                    showingAddHabit = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddHabit(habits: habits)
            }
        }
        .preferredColorScheme(.dark)
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
