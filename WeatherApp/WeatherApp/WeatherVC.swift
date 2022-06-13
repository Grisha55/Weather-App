//
//  WeatherVC.swift
//  WeatherApp
//
//  Created by Григорий Виняр on 12/06/2022.
//

import UIKit

class WeatherVC: UIViewController {

    private var collectionView: UICollectionView?
    private let weakDayPicker = WeekDayPicker()
    
    private let arrWithWeatherData = [WeatherStruct(degree: "22", weatherImage: UIImage(systemName: "sun.min") ?? UIImage(), date: "12.06.2022"),
                                      WeatherStruct(degree: "30", weatherImage: UIImage(systemName: "sun.min") ?? UIImage(), date: "12.06.2022"),
                                      WeatherStruct(degree: "-20", weatherImage: UIImage(systemName: "sun.min") ?? UIImage(), date: "13.06.2022"),
                                      WeatherStruct(degree: "-5", weatherImage: UIImage(systemName: "sun.min") ?? UIImage(), date: "13.06.2022"),
                                      WeatherStruct(degree: "-28", weatherImage: UIImage(systemName: "sun.min") ?? UIImage(), date: "13.06.2022")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(weakDayPicker)
        constraintsForWeakDayPicker()
        setupCollectionView()
    }
    
    // Methods
    
    private func setupCollectionView() {
        let layout = WeatherCollectionViewLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        view.addSubview(collectionView)
        
        collectionView.register(WeatherCell.self, forCellWithReuseIdentifier: WeatherCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: weakDayPicker.bottomAnchor, constant: 30).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    private func constraintsForWeakDayPicker() {
        weakDayPicker.translatesAutoresizingMaskIntoConstraints = false
        weakDayPicker.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10).isActive = true
        weakDayPicker.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        weakDayPicker.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        weakDayPicker.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }

}

extension WeatherVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCell.identifier, for: indexPath) as? WeatherCell else { return UICollectionViewCell() }
        cell.weatherStruct = arrWithWeatherData[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrWithWeatherData.count
    }
    
}
