//
//  AddNewSugarController.swift
//  Diabetes
//
//  Created by Lambert Lani on 4/28/24.
//

import SwiftUI

struct CounterView: View {
    @State private var counter = 0
    let maxValue: Int

   init(initialValue: Int, maxValue: Int) {
       self._counter = State(initialValue: initialValue)
       self.maxValue = maxValue
   }

    var body: some View {
        HStack {
            if counter >= 10 {
                Text("\(counter / 10)")
                    .font(.system(size: 60, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
            }
            Text("\(counter % 10)")
                .font(.system(size: 60, weight: .bold))
                .foregroundColor(.white)
                .padding(.bottom, 5)
        }
        .frame(width: 100, height: 100)
        .background(Color.black.opacity(0.7))
        .cornerRadius(10)
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    let offset = value.translation.height
                    let newCounter = Int(round(Double(offset) / 20)) + self.counter
                    withAnimation(.linear(duration: 0.1)) {
                        self.counter = max(0, min(self.maxValue, newCounter))
                    }
                }
                .onEnded { _ in }
        )
        .onTapGesture {
            withAnimation(.linear(duration: 500)) {
                self.counter = 0
            }
        }
    }
}

struct AddNewSugarController: View {
    var body: some View {
        HStack {
            CounterView(initialValue: 5, maxValue: 50)
            Text(".")
                .font(.largeTitle)
            CounterView(initialValue: 6, maxValue: 9)
        }
    }
}


struct AddNewSugarController_Previews: PreviewProvider {
    static var previews: some View {
        AddNewSugarController()
    }
}
