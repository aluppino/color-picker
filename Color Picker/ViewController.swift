//
//  ViewController.swift
//  Color Picker
//
//  Created by Luppino, Angelo on 2/25/16.
//  Copyright © 2016 Angelo Luppino. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redValue: UITextField!
    @IBOutlet weak var greenValue: UITextField!
    @IBOutlet weak var blueValue: UITextField!
    
    @IBOutlet weak var hexValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.borderWidth = 5;
        colorView.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    @IBAction func changeRedSlider(sender: UISlider!) {
        redSlider.value = floor(redSlider.value)
        redValue.text = String(Int(redSlider.value))
        calculateColor(nil)
    }
    
    @IBAction func changeGreenSlider(sender: UISlider!) {
        greenSlider.value = floor(greenSlider.value)
        greenValue.text = String(Int(greenSlider.value))
        calculateColor(nil)
    }
    
    @IBAction func changeBlueSlider(sender: UISlider!) {
        blueSlider.value = floor(blueSlider.value)
        blueValue.text = String(Int(blueSlider.value))
        calculateColor(nil)
    }

    @IBAction func calculateColor(sender: AnyObject!) {
        let r = CGFloat(redSlider.value) / 255
        let g = CGFloat(greenSlider.value) / 255
        let b = CGFloat(blueSlider.value) / 255
        
        colorView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        
        let rHex = String(format:"%02X", Int(255*r))
        let gHex = String(format:"%02X", Int(255*g))
        let bHex = String(format:"%02X", Int(255*b))
        
        hexValue.text = "#\(rHex)\(gHex)\(bHex)"
    }

    @IBAction func enterRedValue(sender: UITextField) {
        if (redValue.text == "") {
            redValue.text = "0"
        }
        if (Float(redValue.text!) > 255) {
            redValue.text = "255"
        }
        redSlider.value = Float(redValue.text!)!
        calculateColor(nil)
    }

    @IBAction func enterGreenValue(sender: UITextField) {
        if (greenValue.text == "") {
            greenValue.text = "0"
        }
        if (Float(greenValue.text!) > 255) {
            greenValue.text = "255"
        }
        greenSlider.value = Float(greenValue.text!)!
        calculateColor(nil)
    }
    
    @IBAction func enterBlueValue(sender: UITextField) {
        if (blueValue.text == "") {
            blueValue.text = "0"
        }
        if (Float(blueValue.text!) > 255) {
            blueValue.text = "255"
        }
        blueSlider.value = Float(blueValue.text!)!
        calculateColor(nil)
    }

}

