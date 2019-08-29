//
//  ViewController.swift
//  Tippy
//
//  Created by Julio Cesar Whatley on 8/28/19.
//  Copyright © 2019 Capi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setTipControlPosition()
        if (billField.hasText) {
            calculateTotalTip()
        }
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true);
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        calculateTotalTip()
    }
    
    func calculateTotalTip() {
        let bill = Double(billField.text!) ?? 0
        
        let tipPercentage = [0.15, 0.18, 0.2];
        
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        setGlobalTipPosition()
        
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total);
    }
    
    
    func setGlobalTipPosition() {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        appDelegate.tipIndex = tipControl.selectedSegmentIndex
    }
    
    func setTipControlPosition() {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        tipControl.selectedSegmentIndex = appDelegate.tipIndex
    }
}

