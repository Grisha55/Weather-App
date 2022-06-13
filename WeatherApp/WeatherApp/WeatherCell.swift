//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Григорий Виняр on 12/06/2022.
//

import UIKit

class WeatherCell: UICollectionViewCell {
    
    static let identifier = "cellIdentifier"
    
    var weatherStruct: WeatherStruct? {
        didSet {
            guard let weatherStruct = weatherStruct else { return }
            degreeLabel.text = weatherStruct.degree
            weatherImageView.image = weatherStruct.weatherImage
            dateLabel.text = weatherStruct.date
        }
    }
    
    private let degreeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 60
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.black.cgColor
        return label
    }()
    
    private let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(weatherImageView)
        addSubview(degreeLabel)
        addSubview(dateLabel)
        
        constraintsForWeatherImageView()
        constraintsForDegreeLabel()
        constraintsForDateLabel()
    }
    
    // Methods
    
    private func constraintsForDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: degreeLabel.bottomAnchor, constant: 3).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    private func constraintsForDegreeLabel() {
        degreeLabel.translatesAutoresizingMaskIntoConstraints = false
        degreeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        degreeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        degreeLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        degreeLabel.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    private func constraintsForWeatherImageView() {
        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        weatherImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        weatherImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        weatherImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        weatherImageView.bottomAnchor.constraint(equalTo: degreeLabel.topAnchor, constant: 10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
