//
//  ViewController.swift
//  WeatherApp
//
//  Created by Григорий Виняр on 11/06/2022.
//

import UIKit

class LoginVC: UIViewController {
    
    let interactiveTransition = CustomInteractiveTransition()
    
    private let loginLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.text = "Login"
        loginLabel.textColor = .white
        loginLabel.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 20)
        return loginLabel
    }()
    
    private let loginTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Login"
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 20)
        return label
    }()
    
    private let passwordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("LogIn", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        view.addSubview(loginLabel)
        view.addSubview(loginTF)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTF)
        view.addSubview(loginButton)
        navigationController?.delegate = self
        
        setupNavBar()
        setupLoginButtonAction()
        
        constraintsForLoginLabel()
        constraintsForLoginTF()
        constraintsForPasswordLabel()
        constraintsForPasswordTF()
        constraintsForLoginbutton()
        
        animateTitlesAppearing()
        animateButtonAppearing()
        animateFieldsAppearing()
    }
    
    // Methods
    
    private func animateFieldsAppearing() {
        let fadeInAnimation = CABasicAnimation(keyPath: "opacity")
        fadeInAnimation.fromValue = 0
        fadeInAnimation.toValue = 1
        fadeInAnimation.duration = 1
        fadeInAnimation.beginTime = CACurrentMediaTime() + 1
        fadeInAnimation.fillMode = CAMediaTimingFillMode.backwards
        
        self.loginTF.layer.add(fadeInAnimation, forKey: nil)
        self.passwordTF.layer.add(fadeInAnimation, forKey: nil)
    }
    
    private func animateButtonAppearing() {
        self.loginButton.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.height / 2)
        
        UIView.animate(withDuration: 1,
                       delay: 1,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: .curveEaseOut,
                       animations: {
                            self.loginButton.transform = .identity
                        },
                       completion: nil)
    }
    
    private func animateTitlesAppearing() {
        let offset = view.bounds.width
        loginLabel.transform = CGAffineTransform(translationX: -offset, y: 0)
        passwordLabel.transform = CGAffineTransform(translationX: offset, y: 0)
        
        UIView.animate(withDuration: 1,
                       delay: 1,
                       options: .curveEaseOut,
                       animations: {
            self.loginLabel.transform = .identity
            self.passwordLabel.transform = .identity
        },
        completion: nil)

    }
    
    func setupLoginButtonAction() {
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
    }
    
    @objc
    func loginButtonAction() {
        if loginTF.text == "12345" && passwordTF.text == "123" {
            navigationController?.pushViewController(TabBarVC(), animated: true)
        } else {
            let alertController = UIAlertController(title: "ERROR!!!", message: "Please check you login/password", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true)
        }
    }
    
    private func constraintsForLoginbutton() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 50).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func constraintsForPasswordTF() {
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 20).isActive = true
        passwordTF.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        passwordTF.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
    }
    
    private func constraintsForPasswordLabel() {
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.topAnchor.constraint(equalTo: loginTF.bottomAnchor, constant: 30).isActive = true
        passwordLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    private func constraintsForLoginTF() {
        loginTF.translatesAutoresizingMaskIntoConstraints = false
        loginTF.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 20).isActive = true
        loginTF.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginTF.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
    }
    
    private func constraintsForLoginLabel() {
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 180).isActive = true
        loginLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Weather App"
    }


}

extension LoginVC: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            self.interactiveTransition.viewController = toVC
            return CustomPushAnimator()
        } else if operation == .pop {
            if navigationController.viewControllers.first != toVC {
                self.interactiveTransition.viewController = toVC
            }
            return CustomPopAnimator()
        }
        return nil
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransition.hasStarted ? interactiveTransition : nil
    }
}
