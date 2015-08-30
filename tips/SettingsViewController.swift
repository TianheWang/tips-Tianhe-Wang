//
//  SettingsViewController.swift
//  tips
//
//  Created by Tianhe Wang on 8/29/15.
//  Copyright (c) 2015 Tianhe Wang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultPercentage: UISegmentedControl!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultPercentage.selectedSegmentIndex = (defaults.valueForKey("tipChoice") as? Int)!
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillAppear(animated)
        defaults.setValue(defaultPercentage.selectedSegmentIndex, forKey: "tipChoice")
    }
}
