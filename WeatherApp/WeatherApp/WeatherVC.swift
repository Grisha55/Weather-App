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
                                      WeatherStruct(degree: "30", weatherImage: UIImage(systemName: "sun.min") ?? UIImage(), date: "12.06.2022")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(weakDayPicker)
        constraintsForWeakDayPicker()
        setupCollectionView()
    }
    
    // Methods
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        view.addSubview(collectionView)
        collectionView.register(WeatherCell.self, forCellWithReuseIdentifier: WeatherCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: weakDayPicker.bottomAnchor, constant: 20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    private func constraintsForWeakDayPicker() {
        weakDayPicker.translatesAutoresizingMaskIntoConstraints = false
        weakDayPicker.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10).isActive = true
        weakDayPicker.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        weakDayPicker.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        weakDayPicker.heightAnchor.constraint(equalToConstant: 30).isActive = true
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width / 2 - 10
        return CGSize(width: width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
                        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
}
