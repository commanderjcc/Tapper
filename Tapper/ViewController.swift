//
//  ViewController.swift
//  Tapper
//
//  Created by Josh Christensen on 1/17/16.
//  Copyright © 2016 OrangeDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //vars
    var maxTaps = 0
    var currentTaps = 0
    
    //outlets
    @IBOutlet weak var playbtn: UIButton!
    @IBOutlet weak var tapTxt: UITextField!
    @IBOutlet weak var TapperLogo: UIImageView!
    
    @IBOutlet weak var coinbtn: UIButton!
    @IBOutlet weak var tapsLbl: UILabel!
    
    
    
    //Actions
    @IBAction func PlayBtnPressed(sender: AnyObject) {
        
        if tapTxt.text != "" && tapTxt.text != nil {
            
            maxTaps = Int(tapTxt.text!)!
            currentTaps = 0

            playbtn.hidden = true
            tapTxt.hidden = true
            TapperLogo.hidden = true
            
            coinbtn.hidden = false
            tapsLbl.hidden = false
            
            updateTapsLbl()
            
            
        }
    }
    
    @IBAction func coinbtnPressed(sender: AnyObject) {
        currentTaps++
        updateTapsLbl()
        
        if isGameOver() {
            restartGame()
        }
    }
    //Functions
    func restartGame() {
        
        tapTxt.text = nil
        
        playbtn.hidden = false
        tapTxt.hidden = false
        TapperLogo.hidden = false
        
        coinbtn.hidden = true
        tapsLbl.hidden = true
    }
    
    func updateTapsLbl() {
        tapsLbl.text = "\(currentTaps) Taps"
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tapTxt.delegate = self;
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}

