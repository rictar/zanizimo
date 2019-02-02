//
//  TimePickerView.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 2/1/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import UIKit

class ZanizimoPickerView: UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate{
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if data != nil {
            return data!.count
        } else {
            return 0
        }
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if data != nil {
            return data![row]
        } else {
            return ""
        }
    }
    
    public var data: [String]? {
        didSet {
            super.delegate = self
            super.dataSource = self
            self.reloadAllComponents()
        }
    }
    
    public var textFieldBeingEdited: UITextField?
    
    
    public var selectedValue: String {
        get {
            if data != nil {
                return data![selectedRow(inComponent: 0)]
            } else {
                return ""
            }
        }
    }
    
}
