//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Nandini Kapa on 8/2/20.
//  Copyright © 2020 Nandini Kapa. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    // access deafult saved data
    let defaults = UserDefaults.standard
    @IBOutlet weak var defaultTip: UISlider!
    @IBOutlet weak var defaultTipLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set grey gradient
        let gradient = CAGradientLayer()
        gradient.frame = view.frame
        
        // color 1 --> #36D1DC
        let color1 = UIColor(red: 54.0/255.0, green: 209.0/255.0, blue: 220.0/255.0, alpha: 1).cgColor
        
        // color2 --> #5B86E5
        let color2 = UIColor(red: 91.0/255.0, green: 134.0/255.0, blue: 229.0/255.0, alpha: 1).cgColor
        
        // add colors to gradient and to view sublayer
        gradient.colors = [color1, color2]
        view.layer.insertSublayer(gradient, at: 0)
        
        // show saved values
        defaultTip.value = defaults.float(forKey: "deafultTip")
        
        defaultTipLabel.text = "\(Int(round(defaultTip.value)))%"
    }
    

    @IBAction func onDefaultChange(_ sender: Any) {
        defaultTipLabel.text = "\(Int(round(defaultTip.value)))%"
    
        defaults.set(defaultTip.value, forKey: "deafultTip")
    }

}
