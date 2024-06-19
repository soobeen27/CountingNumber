//
//  ViewController.swift
//  CountingNumber
//
//  Created by Soo Jang on 6/19/24.
//

import UIKit

class ViewController: UIViewController {

    var num = 0
    
    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = String(num)
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 45)
        label.textAlignment = .center
        return label
    }()
    
    lazy var incrementBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("증가", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 8
        btn.addTarget(self, action: #selector(incrementBtnTapped), for: .touchDown)
        return btn
    }()
    
    lazy var decrementBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("감소", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .red
        btn.layer.cornerRadius = 8
        btn.addTarget(self, action: #selector(decrementBtnTapped), for: .touchDown)
        return btn
    }()
    
    lazy var initialiseBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("초기화", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .gray
        btn.layer.cornerRadius = 8
        btn.addTarget(self, action: #selector(initialiseBtnTapped), for: .touchDown)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        // Do any additional setup after loading the view.
    }

    func setLayout() {
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        incrementBtn.translatesAutoresizingMaskIntoConstraints = false
        decrementBtn.translatesAutoresizingMaskIntoConstraints = false
        initialiseBtn.translatesAutoresizingMaskIntoConstraints = false
        [numberLabel, incrementBtn, decrementBtn, initialiseBtn]
            .forEach {
                view.addSubview($0)
            }
        NSLayoutConstraint.activate([
            numberLabel.widthAnchor.constraint(equalToConstant: 80),
            numberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            incrementBtn.widthAnchor.constraint(equalToConstant: 80),
            incrementBtn.heightAnchor.constraint(equalToConstant: 30),
            incrementBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            incrementBtn.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 32),
            
            decrementBtn.widthAnchor.constraint(equalToConstant: 80),
            decrementBtn.heightAnchor.constraint(equalToConstant: 30),
            decrementBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            decrementBtn.trailingAnchor.constraint(equalTo: numberLabel.leadingAnchor, constant: -32),
            
            initialiseBtn.widthAnchor.constraint(equalToConstant: 80),
            initialiseBtn.heightAnchor.constraint(equalToConstant: 30),
            initialiseBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            initialiseBtn.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 50)
            
            
            
        ])
    }
    @objc
    func incrementBtnTapped() {
        num += 1
        numberLabel.text = String(num)
    }
    
    @objc
    func decrementBtnTapped() {
        num -= 1
        numberLabel.text = String(num)
    }
    
    @objc
    func initialiseBtnTapped() {
        num = 0
        numberLabel.text = String(num)
    }
}

