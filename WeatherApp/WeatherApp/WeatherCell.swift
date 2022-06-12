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
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.contentMode = .center
        stack.distribution = .fill
        stack.spacing = 10
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBlue
        addSubview(stack)
        stack.addArrangedSubview(degreeLabel)
        stack.addArrangedSubview(weatherImageView)
        stack.addArrangedSubview(dateLabel)
        
        constraintsForStack()
        constraintsForWeatherImageView()
        constraintsForDegreeLabel()
        constraintsForDateLabel()
    }
    
    // Methods
    
    private func constraintsForDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func constraintsForDegreeLabel() {
        degreeLabel.translatesAutoresizingMaskIntoConstraints = false
        degreeLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        degreeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func constraintsForWeatherImageView() {
        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        weatherImageView.centerXAnchor.constraint(equalTo: stack.centerXAnchor).isActive = true
        weatherImageView.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 10).isActive = true
        weatherImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    private func constraintsForStack() {
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
