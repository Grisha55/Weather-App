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
    var cities = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.register(CityCell.self, forCellReuseIdentifier: cellID)
        tableView.dataSource = self
        tableView.delegate = self
        
        constraintsForTableView()
        createWeathersArray()
    }
    
    // Methods
    
    private func createWeathersArray() {
        cities = ["Moscow", "Yaroslavl", "Paris", "London", "Madrid"]
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = cities[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ///
    }
    
}
