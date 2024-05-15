//
//  AddNewSugarController.swift
//  Diabetes
//
//  Created by Lambert Lani on 4/28/24.
//

import SwiftUI

struct AddNewSugarController: View {
    @StateObject var viewModel = ViewModel()
       
       var body: some View {
           NavigationView {
               Form {
                   Section {
                       HStack {
                           Spacer()
                           Text("\(viewModel.selection.value) . \(viewModel.selection.decimals)")
                               .font(.largeTitle)
                           Spacer()
                       }
                       .contentShape(Rectangle())
                       .onTapGesture {
                           withAnimation {
                               viewModel.isPickerVisible.toggle()
                           }
                       }
                       if viewModel.isPickerVisible {
                           SugarPicker(selection: $viewModel.selection, values: Array(1...50), decimals: Array(0..<10))
                       }
                   }
               }
            .navigationTitle("Введите сахар")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        let sugar: Double = Double("\(viewModel.selection.value).\(viewModel.selection.decimals)") ?? 5.6
                        print(sugar)
                    }) {
                        Text("Сохранить")
                            .font(.title2)
                            .colorMultiply(.black)
                    }
                }
            }
        }
    }
}

extension AddNewSugarController {
    final class ViewModel: ObservableObject {
        @Published var selection = BloodSugar(value: 5, decimals: 6)
        @Published var isPickerVisible = false
    }
}

struct AddNewSugarController_Previews: PreviewProvider {
    static var previews: some View {
        AddNewSugarController()
    }
}
