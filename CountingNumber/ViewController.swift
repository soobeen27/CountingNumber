//
//  ViewController.swift
//  CountingNumber
//
//  Created by Soo Jang on 6/19/24.
//

import UIKit
import SnapKit

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
        [numberLabel, incrementBtn, decrementBtn, initialiseBtn]
            .forEach {
                view.addSubview($0)
            }
        numberLabel.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.center.equalToSuperview()
        }
        
        incrementBtn.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 80, height: 30))
            $0.centerY.equalToSuperview()
            $0.left.equalTo(numberLabel.snp.right).offset(32)
        }
        decrementBtn.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 80, height: 30))
            $0.centerY.equalToSuperview()
            $0.right.equalTo(numberLabel.snp.left).offset(-32)
        }
        initialiseBtn.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 80, height: 30))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(numberLabel.snp.bottom).offset(50)
        }
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

