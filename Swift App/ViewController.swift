//
//  ViewController.swift
//  Swift App
//
//  Created by Paul on 28/10/2019.
//  Copyright © 2019 PDS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var counterLbl: UILabel!
    @IBOutlet weak var greetingLbl: UILabel!
    
    @IBOutlet weak var calculator: UISegmentedControl!
    var lblState = false
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setLbl()
        setCounter()
        
    }
    
    @IBAction func btnPressed(_ sender: Any) {
        setLbl()
        counter+=1
        setCounter()
        
    }
    
    func setLbl(){
        
        var add = true
        
        if txt1.text != "" || txt2.text != "" {
            
            var var1 = 0
            var var2 = 0
            
            if let v1 = Int(txt1.text!) {
                var1 = v1
            } else {
                var1 = 0
                txt1.text = "0"
            }
            
            if let v2 = Int(txt2.text!) {
                var2 = v2
            } else {
                var2 = 0
                txt2.text = "0"
            }
            
            if calculator.selectedSegmentIndex == 0 {
                add = true
            } else {
                add = false
            }
            
            self.greetingLbl.text = getResult(addition: add, var1: var1, var2: var2)
            
        } else {
            
            if lblState == true {
                       self.greetingLbl.text = "Buttons are cool!"
                       
                   } else {
                       self.greetingLbl.text = "Hello"
                       
                   }
                   lblState = !lblState
            
        }
        
        
       
        
    }
    
    func setCounter() {
        if counter <= 10 {
            counterLbl.text = "Pressed: \(counter) times."
        } else {
            counter = 0
            txt1.text = ""
            txt2.text = ""
            counterLbl.text = "R E S E T"
        }
        
    }
    
    func getResult(addition:Bool, var1:Int, var2:Int) -> String {
        if addition {
            return "SUM = \(var1 + var2)"
        } else {
            return "DIFFERENCE = \(var1 - var2)"
        }
    
    }
    

}

