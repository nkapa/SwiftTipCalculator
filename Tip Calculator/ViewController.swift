//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Nandini Kapa on 8/2/20.
//  Copyright © 2020 Nandini Kapa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Access UserDefaults
    let defaults = UserDefaults.standard

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipPercent: UISlider!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var totalTitle: UILabel!
    @IBOutlet weak var shareTitle: UILabel!
    @IBOutlet weak var peopleSplit: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tipPercent.value = defaults.float(forKey: "deafultTip")
        
        //Update Tip Percent Text
        percentLabel.text = "\(Int(round(tipPercent.value)))%"
        
        self.calculateTip(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create Blue Gradient and add to View Frame
        let gradient = CAGradientLayer()
        gradient.frame = view.frame
        
        // color 1 --> #36D1DC
        let color1 = UIColor(red: 54.0/255.0, green: 209.0/255.0, blue: 220.0/255.0, alpha: 1).cgColor
        
        // color2 --> #5B86E5
        let color2 = UIColor(red: 91.0/255.0, green: 134.0/255.0, blue: 229.0/255.0, alpha: 1).cgColor
        
        // add colors to gradient and to view sublayer
        gradient.colors = [color1, color2]
        view.layer.insertSublayer(gradient, at: 0)
        
        // make bill amount first responder
        billField.becomeFirstResponder()
        
    }

    @IBAction func onSplitChange(_ sender: Any) {
        
        let peopleArr = [1.0, 2.0, 3.0, 4.0, 5.0]
        
        if(peopleArr[peopleSplit.selectedSegmentIndex] != 1) {
            totalTitle.text = "Total Per Person"
            shareTitle.text = "People Sharing this Meal"

        }
        else {
            totalTitle.text = "Total"
            shareTitle.text = "Person Not Sharing this Meal"
        }
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let peopleArr = [1.0, 2.0, 3.0, 4.0, 5.0]
        
        //Update Tip Percent Text
        percentLabel.text = "\(Int(round(tipPercent.value)))%"
        
        // Get the bill amount
        let billAmount = Double(billField.text!) ?? 0
        
        // Calculate tip and total
        let tip = billAmount * Double(round(tipPercent.value) / 100)
        print()
        let total = (billAmount + tip) / peopleArr[peopleSplit.selectedSegmentIndex]
        
        // Update tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

