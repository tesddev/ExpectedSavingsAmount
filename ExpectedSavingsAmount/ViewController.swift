//
//  ViewController.swift
//  ExpectedSavingsAmount
//
//  Created by GIGL iOS on 10/07/2022.
//

import UIKit

class ViewController: UIViewController {

    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Today's date is \(Date())"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let instructionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Press button to see the amount due today"
        textView.isEditable = false
        textView.textColor = .black
        textView.font = .systemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        return textView
    }()
    
    var calculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Yes", for: .normal)
        button.addTarget(self, action: #selector(didTapYesButton), for: .touchUpInside)
        button.setTitle("Calculate", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.layer.cornerRadius = 20
        button.heightAnchor.constraint(equalToConstant: 42).isActive = true
        button.backgroundColor = #colorLiteral(red: 0.5061172843, green: 0.7235409021, blue: 0.5011855364, alpha: 1)
        return button
    }()
    
    let answerLabel: UILabel = {
        let label = UILabel()
        label.text = "0.00 Naira"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.borderColor = #colorLiteral(red: 0.5061172843, green: 0.7235409021, blue: 0.5011855364, alpha: 1)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        constraintViews()
    }
    
    func constraintViews() {
        view.addSubview(headerLabel)
        view.addSubview(instructionTextView)
        view.addSubview(calculateButton)
        view.addSubview(answerLabel)
                
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            headerLabel.widthAnchor.constraint(equalToConstant: 270),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            instructionTextView.bottomAnchor.constraint(equalTo: answerLabel.topAnchor, constant: -60),
            instructionTextView.widthAnchor.constraint(equalToConstant: 290),
            instructionTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            instructionTextView.heightAnchor.constraint(equalToConstant: 50),
            
            answerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            answerLabel.widthAnchor.constraint(equalToConstant: 270),
            answerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            calculateButton.widthAnchor.constraint(equalToConstant: 150),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -130)
        ])
    }
    
    func shorterCalcOfToday() -> Int {
        let date = Date()
        let cal = Calendar.current
        let day = cal.ordinality(of: .day, in: .year, for: date)

        guard let today = day else { return 0}
        return today
    }
    ///shorterCalc()
    func moneyExpectedToday() -> Int {
        return shorterCalcOfToday() * 100
    }
    
    func formattedAmount() -> String {
        let amount = 12345678.9
        let amountString = amount.formatted(.currency(code: "NGN"))
        return amountString
    }

    
    @objc func didTapYesButton() {
        print("Yes pressed")
        DispatchQueue.main.async { [weak self] in
            self?.answerLabel.text = self?.formattedAmount()
        }
    }
}

