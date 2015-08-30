//
//  ViewController.swift
//  tips
//
//  Created by Tianhe Wang on 7/27/15.
//  Copyright (c) 2015 Tianhe Wang. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    var tipPercentage: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        tipControl.selectedSegmentIndex = (defaults.valueForKey("tipChoice") as? Int)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        updateValues()
    }
    
    func updateValues() {
        var tipPercentages = [0.18, 0.2, 0.22]
        tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage!
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

}

