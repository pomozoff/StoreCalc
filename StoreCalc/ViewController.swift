//
//  ViewController.swift
//  StoreCalc
//
//  Created by Антон on 12/12/2016.
//  Copyright © 2016 Akademon Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
                      UITextFieldDelegate
{
    
    // MARK: - Outlets

    @IBOutlet weak var product1Label: UILabel!
    @IBOutlet weak var product2Label: UILabel!
    @IBOutlet weak var totalLabel: UITextField!
    
    @IBOutlet weak var price1TextField: UITextField!
    @IBOutlet weak var price2TextField: UITextField!
    @IBOutlet weak var amount1TextField: UITextField!
    @IBOutlet weak var amount2TextField: UITextField!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        calculate()
    }
    
    // MARK: - Private
    
    fileprivate func calculate() {
        guard let priceText1 = price1TextField.text, let price1 = Double(priceText1),
              let priceText2 = price2TextField.text, let price2 = Double(priceText2),
              let amountText1 = amount1TextField.text, let amount1 = Double(amountText1),
              let amountText2 = amount2TextField.text, let amount2 = Double(amountText2)
        else { return }
        
        let total1 = Int(price1 / amount1 * 100)
        let total2 = Int(price2 / amount2 * 100)
        
        let benefit: Double
        let backgroundColor1: UIColor
        let backgroundColor2: UIColor
        
        if total1 == total2 {
            benefit = 0
            backgroundColor1 = UIColor.white
            backgroundColor2 = UIColor.white
        } else {
            let isTotal1Lower = total1 < total2
            benefit = 100 - Double(isTotal1Lower ? (total1 * 100 / total2) : (total2 * 100 / total1))

            backgroundColor1 = isTotal1Lower ? UIColor.green : UIColor.red
            backgroundColor2 = !isTotal1Lower ? UIColor.green : UIColor.red
        }
        
        product1Label.backgroundColor = backgroundColor1
        product2Label.backgroundColor = backgroundColor2
        
        totalLabel.text = String(format: "%.2f%%", benefit)
    }

}
