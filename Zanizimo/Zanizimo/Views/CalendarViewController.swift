//
//  TabOneViewController.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/17/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import UIKit

let FoodData = [
    ["foodName": "Huevo con Jamon", "schedule": "7:00 - 9:00", "meal": "breakfast"],
    ["foodName": "Pepino", "schedule": "10:00 - 11:00", "meal": "snackOne"],
    ["foodName": "Pechuga Asada", "schedule": "13:30 - 14:30 ", "meal": "lunch"],
    ["foodName": "Cacahuates", "schedule": "17:00 - 16:00", "meal": "snackTwo"],
    ["foodName": "Gelatina", "schedule": "21:00 - 22:00", "meal": "dinner"]
]

class CalendarViewController: UIViewController {
    
    var tableView: UITableView!
    
    private var didSetupview = false
    
    var buttons = [DayButton]()
    
    var selectedIndex = Calendar.current.component(.weekday, from: Date())
    
    var containerView = UIView(frame: CGRect.zero)
    
    let sectionHeaderHeight: CGFloat = 20
    
    var data = [TableSection: [[String: String]]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if didSetupview == false {
            setupTableView()
            setupContainerView()
            didSetupview = true
            //MockData
            sortData()
        }
        
        self.navigationController?.navigationBar.barStyle = .blackOpaque
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "Purple")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController!.navigationBar.addSubview(containerView)
        tableView.reloadData()
    }
    
    func setupTableView(){
        view.backgroundColor = UIColor(named: "Purple")
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: displayWidth, height: displayHeight - barHeight))
        
        self.edgesForExtendedLayout = .bottom
        self.extendedLayoutIncludesOpaqueBars = false
        tableView.contentInsetAdjustmentBehavior = .automatic
        tableView.isScrollEnabled = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor(named: "Purple")
        tableView.allowsSelection = true
        self.view.addSubview(tableView)
    }
    
    func setupContainerView(){
        containerView = UIView(frame: navigationController!.navigationBar.bounds)
        let n = 7
        for i in 0..<n {
            let width = (containerView.bounds.width - 16) / CGFloat(n)
            let height = containerView.bounds.height
            let button = DayButton(frame: CGRect(x: 8 + CGFloat(i) * width, y: 0, width: width, height: height))
            containerView.addSubview(button)
            buttons.append(button)
            button.addTarget(self, action: #selector(CalendarViewController.buttonTapped(_:)), for: .touchUpInside)
            
            let date = getDay(i+1)
            
            button.contentView.dayLabel.text = String(date.dayNumberInWeek())
            button.contentView.dayNameLabel.text = date.dayFormat(format: "EEEEE")
            
            if date.isCurrentDay() {
                button.isSelected = true
                selectedIndex = i
            }
        }
    }
    
    func getDay(_ day:Int) -> Date {
        
        let date = Date()
        let currentDay = Calendar.current.component(.weekday, from: date)
        
        var count = 0
        if currentDay > day{
            count = day - currentDay
        }else if currentDay < day{
            count = (day - currentDay)
        }
        
        return date.getDay(count)
    }
    
    //MockData
    func sortData() {
        data[.breakfast] = FoodData.filter({ $0["meal"] == "breakfast" })
        data[.snackOne] = FoodData.filter({ $0["meal"] == "snackOne" })
        data[.lunch] = FoodData.filter({ $0["meal"] == "lunch" })
        data[.snackTwo] = FoodData.filter({ $0["meal"] == "snackTwo" })
        data[.dinner] = FoodData.filter({ $0["meal"] == "dinner" })
    }
    
    @objc func buttonTapped(_ sender: DayButton) {
        let newIndex = buttons.index(of: sender) ?? 0
        if newIndex == selectedIndex {
            return
        }
        
        let dx = (newIndex > selectedIndex) ? -self.view.frame.width : self.view.frame.width
        
        buttons[selectedIndex].isSelected = false
        sender.isSelected = true
        selectedIndex = newIndex
        
        UIView.animate(withDuration: 0.2, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: { () -> Void in
            self.tableView.transform = CGAffineTransform(translationX: dx, y: 0)
        }) { (_) -> Void in
            self.tableView.transform = CGAffineTransform(translationX: -dx, y: 0)
            //Actualizar los datos
            self.tableView.reloadData()
            UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: { () -> Void in
                self.tableView.transform = CGAffineTransform.identity
            }, completion: { (_) -> Void in
                
            })
        }
    }
}

extension CalendarViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return TableSection.total.rawValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: sectionHeaderHeight))
        view.backgroundColor = UIColor(red: 253.0/255.0, green: 240.0/255.0, blue: 196.0/255.0, alpha: 1)
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.bounds.width - 30, height: sectionHeaderHeight))
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.black
        if let tableSection = TableSection(rawValue: section) {
            label.text = tableSection.name()
        }
        view.addSubview(label)
        return view
    }
    
    func checkCell(_ cell:UITableViewCell){
//        let size: CGFloat = 26
//        let digits = CGFloat( 1 ) // digits in the label
//        let width = max(size, 0.7 * size * digits) // perfect circle is smallest allowed
//        let badge = UILabel(frame:CGRect(x: 0, y: 0, width: width, height: size))
//        //badge.text = "1"
//        badge.layer.cornerRadius = size / 2
//        badge.layer.masksToBounds = true
//        badge.textAlignment = .center
//        badge.textColor = UIColor.white
//        badge.backgroundColor = UIColor.green
        let badgeImage = UIImageView(image:UIImage(named: "carrot"))
        cell.accessoryView = badgeImage
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") else {
                return UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "UITableViewCell")
            }
            return cell
        }()
        if let tableSection = TableSection(rawValue: indexPath.section), let food = data[tableSection]?[indexPath.row] {
            if let titleLabel = cell.textLabel {
                titleLabel.text = food["foodName"]
                titleLabel.textColor = UIColor.white
                titleLabel.backgroundColor = UIColor.clear
            }
            if let subtitleLabel = cell.detailTextLabel {
                subtitleLabel.text = food["schedule"]
                subtitleLabel.textColor = UIColor.white
                subtitleLabel.backgroundColor = UIColor.clear
            }
            cell.backgroundView = UIImageView(image: UIImage(named: "imagen1"))
            
            checkCell(cell)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let tableSection = TableSection(rawValue: indexPath.section), let food = data[tableSection]?[indexPath.row] {
            tableView.deselectRow(at: indexPath, animated: true)
            containerView.removeFromSuperview()
            let viewController = DetailMenuViewController()
            viewController.label = food["foodName"]
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
    }
    
}
