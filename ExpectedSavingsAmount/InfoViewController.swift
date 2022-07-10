//
//  InfoViewController.swift
//  ExpectedSavingsAmount
//
//  Created by GIGL iOS on 10/07/2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = #colorLiteral(red: 0.5061172843, green: 0.7235409021, blue: 0.5011855364, alpha: 1)
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return button
    }()

    let infoTextView: UITextView = {
        let textView = UITextView()
        textView.text = Constants.GeneralStrings.info
        textView.isEditable = false
        textView.textColor = .black
        textView.font = .systemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        constraintViews()
    }
    
    func constraintViews() {
        view.addSubview(backButton)
        view.addSubview(infoTextView)
                
        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            infoTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            infoTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            infoTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoTextView.heightAnchor.constraint(equalToConstant: 200),
            
        ])
    }
    
    @objc func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }

    

}

class Constants{
    enum GeneralStrings {
        static  let info = "This app was developed by Tesleem Amuda on July 10th, 2022 to help calculate the amount due each time. Originally set at 100 naira per day from the first day of the year, up until any day checked. Updates may be done at intervals."
    }
}
