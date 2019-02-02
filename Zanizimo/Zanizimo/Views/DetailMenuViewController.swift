//
//  DetailMenuViewController.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/26/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import UIKit
import CoreML
import AVFoundation

class DetailMenuViewController: UIViewController {
    
    var detailMenu:DetailMenuview!
    var meal:Meal!
    var schedule:String!
    
    var mealTable : [MealTable]!
    
    weak var delegate: MealDelegate?
    
    private var userTakePhoto = false {
        didSet {
            self.navigationItem.rightBarButtonItem?.isEnabled = userTakePhoto
        }
    }
    
    
    override func loadView() {
        super.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    func setupView() {
        
        let save = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(DetailMenuViewController.save))
        self.navigationItem.rightBarButtonItem = save
        save.isEnabled = userTakePhoto
        detailMenu = DetailMenuview()
        detailMenu.delegateTableView = self
        detailMenu.tableView.register(UINib(nibName: "MealTableViewCell", bundle: nil), forCellReuseIdentifier: "detailCell")
        detailMenu.dataSource = self
        detailMenu.delegateTableView = self
        meal.getImage { [weak self] img in
            self?.detailMenu.imageView.image = img
        }
        
        if meal.isChecked!{
            detailMenu.button.isEnabled = true
        }
        
        view.addSubview(detailMenu)
        detailMenu.translatesAutoresizingMaskIntoConstraints = false
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            detailMenu.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 0.0),
            guide.bottomAnchor.constraint(equalToSystemSpacingBelow: detailMenu.bottomAnchor, multiplier: 0.0),
            guide.leadingAnchor.constraint(equalToSystemSpacingAfter: detailMenu.leadingAnchor, multiplier: 0.0),
            guide.trailingAnchor.constraint(equalToSystemSpacingAfter: detailMenu.trailingAnchor, multiplier: 0.0)
            ])
        detailMenu.delegate = self
        
        mealTable = meal.transformToViewMeal(schedule: schedule)
        
    }
    
    
    @objc func save(sender: UIBarButtonItem) {
        
        let image = detailMenu.imageView.image!
        
        let isValid = FoodValidator.sharedInstance.processImage(image)
        
        if isValid{
            delegate?.checkMeal()
            navigationController?.popViewController(animated: true)
            
        }
        
        let alert = UIAlertController(title: "Error", message: "The captured image does not correspond with food", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Retry", style: .default) { [unowned self] action  in
            let imagePickerView = UIImagePickerController()
            imagePickerView.delegate = self
            imagePickerView.sourceType = .camera
            self.present(imagePickerView, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert,animated: true)
    }
}

extension DetailMenuViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        userTakePhoto = true
        guard let image = info[.originalImage] as? UIImage else {
            print("No image found")
            return
        }
        self.detailMenu.imageView.image = image
    }
}

extension DetailMenuViewController:DetailMenuviewDelegate{
    func takePhoto() {
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        
        switch cameraAuthorizationStatus {
        case .notDetermined: requestCameraPermission()
        case .authorized: presentCamera()
        case .restricted, .denied: alertCameraAccessNeeded()
        }
    }
    
    func presentCamera()  {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let imagePickerView = UIImagePickerController()
        imagePickerView.delegate = self
        
        alert.addAction(UIAlertAction(title: "Take Image", style: .default) { _ in
            imagePickerView.sourceType = .camera
            self.present(imagePickerView, animated: true, completion: nil)
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func requestCameraPermission() {
        AVCaptureDevice.requestAccess(for: .video, completionHandler: {accessGranted in
            guard accessGranted == true else { return }
            self.presentCamera()
        })
    }
    
    func alertCameraAccessNeeded() {
        let settingsAppURL = URL(string: UIApplication.openSettingsURLString)!
        
        let alert = UIAlertController(
            title: "Need Camera Access",
            message: "Camera access is required to make full use of this app.",
            preferredStyle: UIAlertController.Style.alert
        )
        
        
        alert.addAction(UIAlertAction(title: "Allow Camera", style: .cancel, handler: { (alert) -> Void in
            UIApplication.shared.open(settingsAppURL, options: [:], completionHandler: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}


extension DetailMenuViewController:UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return mealTable.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mealTable[section].sectionLabel != nil{
            return 1
        }else{
            return mealTable[section].sectionObjects.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return mealTable[section].sectionName
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.detailMenu.tableView.dequeueReusableCell(withIdentifier: "detailCell") as! MealTableViewCell
        
        cell.backgroundColor = UIColor.init(named: "Purple")
        
        
        if let text = mealTable[indexPath.section].sectionLabel {
            cell.nameLabel.text = text
            cell.descriptionLabel.text = ""
            cell.nameLabel.textColor = UIColor.white
            cell.descriptionLabel.textColor = UIColor.white
        }else{
            let mealCell = mealTable[indexPath.section].sectionObjects[indexPath.row]
            cell.nameLabel.text = mealCell.name
            cell.descriptionLabel.text = mealCell.description
            cell.nameLabel.textColor = UIColor.white
            cell.descriptionLabel.textColor = UIColor.white
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    
}
