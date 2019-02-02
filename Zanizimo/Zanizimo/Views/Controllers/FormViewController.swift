//
//  FormViewController.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/28/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var sexInput: UITextField!
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var breakfastTimeInput: UITextField!
    @IBOutlet weak var snackOneTimeInput: UITextField!
    @IBOutlet weak var lunchTimeInput: UITextField!
    @IBOutlet weak var snackTwoTimeInput: UITextField!
    @IBOutlet weak var dinnerTimeInput: UITextField!
    
    @IBOutlet weak var titleLabel: CustomLabel!
    
    
    @IBOutlet weak var saveButton: UIButton!
    
    var picker: ZanizimoPickerView?
    var pickerAccessory: UIToolbar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        view.backgroundColor = UIColor(named: "Purple")
        let sexData = ["H","M"]
        sexInput.tag = FormTag.SexInput.rawValue
        setPickerFor(textField: sexInput,array: sexData)
        let timeData = (0...23).map { String($0) }
        UILabel.appearance().tintColor = UIColor.white
        
        if self.parent != nil{
            titleLabel.text = "Settings"
        }
        
        
        saveButton.backgroundColor = UIColor.orange
        saveButton.layer.cornerRadius = 10
        saveButton.clipsToBounds = true
        saveButton.tintColor = UIColor.white
        
        
        breakfastTimeInput.tag = FormTag.BreakFast.rawValue
        snackOneTimeInput.tag = FormTag.SnackOne.rawValue
        lunchTimeInput.tag = FormTag.Lunch.rawValue
        snackTwoTimeInput.tag = FormTag.SnackTwo.rawValue
        dinnerTimeInput.tag = FormTag.Dinner.rawValue
        setPickerFor(textField: breakfastTimeInput,array: timeData)
        setPickerFor(textField: snackOneTimeInput,array: timeData)
        setPickerFor(textField: lunchTimeInput,array: timeData)
        setPickerFor(textField: snackTwoTimeInput,array: timeData)
        setPickerFor(textField: dinnerTimeInput,array: timeData)
        setupTextField(textField: nameInput)
        
        recoverDefaults()
        
        
    }
    
    func setupTextField(textField:UITextField){
        UITextField.appearance().backgroundColor = UIColor(named: "Purple")
        
    }
    
    func recoverDefaults(){
        nameInput.text = DefaultsStorage.recover(key: DefaultsConstants.name.rawValue)
        sexInput.text = DefaultsStorage.recover(key: DefaultsConstants.sex.rawValue)
        weightInput.text = DefaultsStorage.recover(key: DefaultsConstants.weight.rawValue)
        breakfastTimeInput.text = DefaultsStorage.recover(key: DefaultsConstants.breakfastTime.rawValue)
        snackOneTimeInput.text = DefaultsStorage.recover(key: DefaultsConstants.snackTime.rawValue)
        lunchTimeInput.text = DefaultsStorage.recover(key: DefaultsConstants.lunchTime.rawValue)
        snackTwoTimeInput.text = DefaultsStorage.recover(key: DefaultsConstants.snackTwo.rawValue)
        dinnerTimeInput.text = DefaultsStorage.recover(key: DefaultsConstants.dinner.rawValue)
    }
    
    func setPickerFor(textField:UITextField,array:[String]){
        picker = ZanizimoPickerView()
        picker?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        picker?.backgroundColor = UIColor.white
        
        picker?.data = array
        
        textField.inputView = picker
        
        pickerAccessory = UIToolbar()
        pickerAccessory?.autoresizingMask = .flexibleHeight
        
        pickerAccessory?.barStyle = .default
        pickerAccessory?.barTintColor = UIColor(named: "Purple2")
        pickerAccessory?.backgroundColor = UIColor.red
        pickerAccessory?.isTranslucent = false
        
        var frame = pickerAccessory?.frame
        frame?.size.height = 44.0
        pickerAccessory?.frame = frame!
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(FormViewController.cancelBtnClicked(_:)))
        cancelButton.tintColor = UIColor.white
        cancelButton.tag = textField.tag
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(FormViewController.doneBtnClicked(_:)))
        doneButton.tintColor = UIColor.white
        doneButton.tag = textField.tag
        
        pickerAccessory?.items = [cancelButton, flexSpace, doneButton]
        
        textField.inputAccessoryView = pickerAccessory
        
    }
    
    
    func getTextInputWithTag(tag:Int) -> UITextField{
        
        let formTag = FormTag(rawValue: tag)!
            switch formTag {
            case .BreakFast:
                return breakfastTimeInput
            case .SnackOne:
                return snackOneTimeInput
            case .Dinner:
                return dinnerTimeInput
            case .SnackTwo:
                return snackTwoTimeInput
            case .Lunch:
                return lunchTimeInput
            case .SexInput:
                return sexInput
        
        
        }
        
    }
    
    
    @objc func cancelBtnClicked(_ button: UIBarButtonItem?) {
        let textField = getTextInputWithTag(tag: (button?.tag)!)
        textField.resignFirstResponder()
    }
    
    @objc func doneBtnClicked(_ button: UIBarButtonItem?) {
        let textField = getTextInputWithTag(tag: (button?.tag)!)
        textField.resignFirstResponder()
        let picker = textField.inputView as! ZanizimoPickerView
        textField.text = picker.selectedValue
        passFocus(textField: textField)
        
        
    }
    
    
    @IBAction func save(_ sender: UIButton) {
        let name = nameInput.text
        DefaultsStorage.save(key: DefaultsConstants.name.rawValue, value: name!)
        let sex = sexInput.text
        DefaultsStorage.save(key: DefaultsConstants.sex.rawValue, value: sex!)
        let weight = weightInput.text
        DefaultsStorage.save(key: DefaultsConstants.weight.rawValue, value: weight!)
        let breakfastTime = breakfastTimeInput.text
        DefaultsStorage.save(key: DefaultsConstants.breakfastTime.rawValue, value: breakfastTime!)
        let snackTime = snackOneTimeInput.text
        DefaultsStorage.save(key: DefaultsConstants.snackTime.rawValue, value: snackTime!)
        let lunchTime = lunchTimeInput.text
        DefaultsStorage.save(key: DefaultsConstants.lunchTime.rawValue, value: lunchTime!)
        let snackTwo = snackTwoTimeInput.text
        DefaultsStorage.save(key: DefaultsConstants.snackTwo.rawValue, value: snackTwo!)
        let dinner = dinnerTimeInput.text
        DefaultsStorage.save(key: DefaultsConstants.dinner.rawValue, value: dinner!)
        
        if let tabBarController = self.tabBarController{
            tabBarController.selectedIndex = 0
        }else{
            let viewController = ZanizimoTabBarController()
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    func passFocus(textField:UITextField) {
        switch textField {
        case nameInput:
            sexInput.becomeFirstResponder()
        case sexInput:
            weightInput.becomeFirstResponder()
        case weightInput:
            breakfastTimeInput.becomeFirstResponder()
        case breakfastTimeInput:
            snackOneTimeInput.becomeFirstResponder()
        case snackOneTimeInput:
            lunchTimeInput.becomeFirstResponder()
        case lunchTimeInput:
            snackTwoTimeInput.becomeFirstResponder()
        case snackTwoTimeInput:
            dinnerTimeInput.becomeFirstResponder()
        default:
            nameInput.resignFirstResponder()
        }
        
    }
}

extension FormViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passFocus(textField: textField)
        
        return true
        
    }
    
}
