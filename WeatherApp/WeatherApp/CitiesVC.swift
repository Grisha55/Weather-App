//
//  WeatherDataVC.swift
//  WeatherApp
//
//  Created by Григорий Виняр on 11/06/2022.
//

import UIKit

class CitiesVC: UIViewController {

    private let tableView = UITableView()
    let cellID = "cellId"
    var cities = [CityStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.register(CityCell.self, forCellReuseIdentifier: cellID)
        tableView.register(TableHeader.self, forHeaderFooterViewReuseIdentifier: TableHeader.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        constraintsForTableView()
        createWeathersArray()
    }
    
    // Methods
    
    private func createWeathersArray() {
        cities = [CityStruct(name: "Moscow", emblem: UIImage(systemName: "multiply.circle.fill")!), CityStruct(name: "Yaroslavl", emblem: UIImage(systemName: "house")!), CityStruct(name: "Kaliningrad", emblem: UIImage(systemName: "house")!)]
    }
    
    private func constraintsForTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    }
    

}

extension CitiesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CityCell
        cell.cityStruct = cities[indexPath.row]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableHeader.identifier) as! TableHeader
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.present(WeatherVC(), animated: true)
        self.modalPresentationStyle = .fullScreen
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            cities.remove(at: indexPath.row)
            tableView.reloadData()
        case .insert:
            cities.insert(CityStruct(name: "Unknown", emblem: UIImage()), at: 0)
        default:
            print("Default case")
        }
    }
    
}
