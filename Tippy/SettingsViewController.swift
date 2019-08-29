//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Julio Cesar Whatley on 8/28/19.
//  Copyright © 2019 Capi. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setTipControlPosition()
    }
    
    @IBAction func setGlobalPosition(_ sender: Any) {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        appDelegate.tipIndex = tipControl.selectedSegmentIndex
    }
    
    func setTipControlPosition() {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        tipControl.selectedSegmentIndex = appDelegate.tipIndex
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
