//
//  ViewController.swift
//  HomeWork14.2_Karina
//
//  Created by Karina Kovaleva on 23.08.22.
//

import UIKit

class MyView: UIView {
    var buttonSettingsTapped: ((UIButton) -> ())?
    var myBackgroundColor: UIColor = .systemMint
    var myTintColor: UIColor = .black
    var moveButtonTapped : ((UIButton) -> ())?
    
    @IBAction func buttonSettingsTapped(_ sender: UIButton) {
        buttonSettingsTapped?(sender)
    }
    @IBAction func moveButtonTapped( sender: UIButton) {
       moveButtonTapped?(sender)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var viewForButtons: MyView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewForButtons?.buttonSettingsTapped = { [weak self] button in
            self?.buttonSettingsTapped(button) }
        viewForButtons?.moveButtonTapped = { [weak self] button in self?.moveButtonTapped(button) }
    }

    func buttonSettingsTapped(_ button: UIButton) {
        viewForButtons?.subviews.forEach { $0.backgroundColor = viewForButtons?.myBackgroundColor }
        viewForButtons?.subviews.forEach { $0.tintColor = viewForButtons?.tintColor }
        viewForButtons?.subviews.forEach { $0.layer.cornerRadius = $0.frame.height / 2 }
    }
    
    func moveButtonTapped(_ button: UIButton) {
        print("\(String(describing: button.currentTitle))")
    }
}

