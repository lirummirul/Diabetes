//
//  SugarPicker.swift
//  Diabetes
//
//  Created by Lambert Lani on 5/15/24.
//

import SwiftUI

struct BloodSugar {
  let value: Int
  let decimals: Int
}

struct SugarPicker: UIViewRepresentable {
    func updateUIView(_ uiView: UIPickerView, context: Context) { }
    
    
    let selection: Binding<BloodSugar>
    let values: [Int]
    let decimals: [Int]
    
    func makeUIView(context: Context) -> UIPickerView {
        let pickerView = UIPickerView(frame: .zero)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.delegate = context.coordinator
        pickerView.dataSource = context.coordinator
        
        context.coordinator.configureInitialSelection(pickerView: pickerView)
        
        return pickerView
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(selection: selection, values: values, decimals: decimals)
    }
      
    final class Coordinator: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
      let selection: Binding<BloodSugar>
      let values: [Int]
      let decimals: [Int]
          
        init(selection: Binding<BloodSugar>, values: [Int], decimals: [Int]) {
            self.selection = selection
            self.values = values
            self.decimals = decimals
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 2
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           return component == 0 ? values.count : decimals.count
       }
       
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           if component == 0 {
               return "\(values[row])"
           }
           else {
               return "\(decimals[row])"
           }
       }
       
       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           let valueIndex = pickerView.selectedRow(inComponent: 0)
           let decimalsIndex = pickerView.selectedRow(inComponent: 1)
           selection.wrappedValue = BloodSugar(value: values[valueIndex], decimals: decimals[decimalsIndex])
       }
        
        func configureInitialSelection(pickerView: UIPickerView) {
            if let initialValueIndex = values.firstIndex(of: selection.wrappedValue.value),
               let initialDecimalsIndex = decimals.firstIndex(of: selection.wrappedValue.decimals) {
                pickerView.selectRow(initialValueIndex, inComponent: 0, animated: false)
                pickerView.selectRow(initialDecimalsIndex, inComponent: 1, animated: false)
            }
        }
    }
}


struct SugarPicker_Previews: PreviewProvider {
    static var selection = Binding(
        get: {
            BloodSugar(value: 5, decimals: 6)
        },
        set: { value in
            print(value)
        })
    
    static var previews: some View {
        SugarPicker(selection: selection, values: Array(1...50), decimals: Array(0..<10))
    }
}

