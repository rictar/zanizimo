//
//  TabOneViewController.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/17/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
    
    var tableView: UITableView!
    
    private var didSetupview = false
    
    var buttons = [DayButton]()
    
    var selectedIndex = Calendar.current.component(.weekday, from: Date())
    
    var selectedMeal = 0
    
    var containerView = UIView(frame: CGRect.zero)
    
    let sectionHeaderHeight: CGFloat = 20
    
    var weekMenu : WeekMenu!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if didSetupview == false {
            setupTableView()
            setupContainerView()
            didSetupview = true
            //MockData
            if let res = CodableStorage<WeekMenu>.permanent(filename: "weekMenu.json").load(){
                weekMenu = res
            }
            //Llamar cuando se tenga el api
            //loadData()
        }
        
        self.navigationController?.navigationBar.barStyle = .blackOpaque
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "Purple")
    }
    
    
    func loadData() {
        MenuService.shared.all { [weak self] menu in
            self?.weekMenu = menu
            self?.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let res = CodableStorage<WeekMenu>.permanent(filename: "weekMenu.json").load(){
            weekMenu = res
        }
        //tableView.reloadData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.addSubview(containerView)
        tableView.reloadData()
    }
    
    
    
    func setupTableView(){
        view.backgroundColor = UIColor(named: "Purple")
        tableView = UITableView(frame: self.view.safeAreaLayoutGuide.layoutFrame)
        tableView.autoresizingMask = UIView.AutoresizingMask.flexibleHeight
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
        return TypeMeal.total.rawValue
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
        if let tableSection = TypeMeal(rawValue: section) {
            label.text = tableSection.name()
        }
        view.addSubview(label)
        return view
    }
    
    func checkCell(_ cell:UITableViewCell){
        let badgeImage = UIImageView(image:UIImage(named: "carrot"))
        cell.accessoryView = badgeImage
    }
    
    func unCheckCell(_ cell:UITableViewCell){
        cell.accessoryView = nil
        cell.accessoryType = UITableViewCell.AccessoryType.none
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") else {
                return UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "UITableViewCell")
            }
            return cell
        }()
        let dayMenu = weekMenu.getMenuForDay(day: selectedIndex)
        if let food = dayMenu?.dayMenu[indexPath.section] {
            
            
            if let titleLabel = cell.textLabel {
                titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
                titleLabel.text = food.name
                titleLabel.textColor = UIColor(named: "Purple")
                titleLabel.backgroundColor = UIColor.orange
                titleLabel.layer.cornerRadius = 8.0
                titleLabel.layer.cornerRadius = 10
                titleLabel.clipsToBounds = true
            }
            food.getImage { [weak cell] (img) in
                cell?.backgroundView = UIImageView(image: img)
            }
            if food.isChecked ?? false{
                checkCell(cell)
            }else{
                unCheckCell(cell)
            }
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height / 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var dayMenu = weekMenu.getMenuForDay(day: selectedIndex)
        if let food = dayMenu?.dayMenu[indexPath.section] {
            selectedMeal = indexPath.section
            tableView.deselectRow(at: indexPath, animated: true)
            containerView.removeFromSuperview()
            let viewController = DetailMenuViewController()
            viewController.delegate = self
            viewController.meal = food
            let defaults = UserDefaults.standard
            viewController.schedule = defaults.string(forKey: "com.mx.rictar.Zanizimo.\(food.typeMeal.getKeyName())")
            viewController.day = getDay(selectedIndex+1)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
    }
}

extension CalendarViewController:MealDelegate{
    func checkMeal() {
        self.weekMenu.check(day: self.selectedIndex, meal: self.selectedMeal)
        //CodableStorage<WeekMenu>.permanent(filename: "weekMenu.json").save(data: self.weekMenu)
        DispatchQueue.global( qos: .background).async { [weak self] in
            CodableStorage<WeekMenu>.permanent(filename: "weekMenu.json").save(data: (self?.weekMenu)!)
        }
        
        
        
    }
    
    
}
