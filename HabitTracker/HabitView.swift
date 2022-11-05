//
//  HabitView.swift
//  HabitTracker
//
//  Created by mitch on 11/2/22.
//  Copyright © 2022 mleers. All rights reserved.
//


import SwiftUI

struct HabitView: View {
    @Binding var habit: HabitItem

    var body: some View {
        VStack(alignment: .leading, spacing: 50) {
            Text("Description: \(habit.description)")
                .font(.title3)
                .padding(.vertical)
            
            Text("Goal completed \(habit.amount) \(habit.amount == 1 ? "time" : "times")")
                .font(.title3)
            Text("Adjust:")
                .font(.title3)

            HStack(spacing: 30) {
                Button {
                    decrement()
                } label: {
                    Image(systemName: "minus")
                        .font(Font.title.weight(.semibold))
                        .frame(width: 100, height: 50)
                        .foregroundColor(Color.white)
                        .background(Color.red)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                
                Button {
                    increment()
                } label: {
                    Image(systemName: "plus")
                        .font(Font.title.weight(.semibold))
                        .frame(width: 100, height: 50)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                
                Button {
                    reset()
                } label: {
                    Image(systemName: "slash.circle")
                        .font(Font.title.weight(.semibold))
                        .frame(width: 100, height: 50)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
            Spacer()
        }
        .navigationTitle(habit.name)
        .padding(.horizontal, 20)
    }
    
    func increment() {
        habit.amount += 1
    }
    
    func decrement() {
        if habit.amount > 0 {
            habit.amount -= 1
        }
    }
    
    func reset() {
        habit.amount = 0
    }
}

//struct HabitView_Previews: PreviewProvider {
//    static let habits = HabitItem(name: "test", description: "asd", amount: 1)
//
//    static var previews: some View {
//        HabitView(habit: habits)
//    }
//}
