//
//  ViewController.swift
//  Bout Time2
//
//  Created by Just Fuad on 10/08/2016.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var firstEventLabel: UILabel!
    @IBOutlet weak var secondEventLabel: UILabel!
    @IBOutlet weak var thirdEventLabel: UILabel!
    @IBOutlet weak var fourthEventLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var shakeToComplete: UILabel!
    @IBOutlet weak var beginGameOutlet: UIButton!
    @IBOutlet weak var boutTimeText: UILabel!
    
    @IBAction func moveLabel(sender: AnyObject) {
        let firstText = firstEventLabel.text
        let secondText = secondEventLabel.text
        let thirdText = thirdEventLabel.text
        let fourthText = fourthEventLabel.text
        
        if sender.tag == 101 || sender.tag == 102 {
            firstEventLabel.text = secondText
            secondEventLabel.text = firstText
        }
        
        if sender.tag == 103 || sender.tag == 104 {
            secondEventLabel.text = thirdText
            thirdEventLabel.text = secondText
        }
        
        if sender.tag == 105 || sender.tag == 106 {
            thirdEventLabel.text = fourthText
            fourthEventLabel.text = thirdText
        }
        
    }
    
    var count = 59
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        firstEventLabel.hidden = true
        secondEventLabel.hidden = true
        thirdEventLabel.hidden = true
        fourthEventLabel.hidden = true
        timerLabel.hidden = true
        shakeToComplete.hidden = true
    }
    
    @IBAction func beginGame() {
        beginGameOutlet.hidden = true
        boutTimeText.hidden = true
        displayGame()
        beginCountDown()
        populateRandomText()
    }
    
    func displayGame(){
        firstEventLabel.hidden = false
        secondEventLabel.hidden = false
        thirdEventLabel.hidden = false
        fourthEventLabel.hidden = false
        timerLabel.hidden = false
        shakeToComplete.hidden = false
    }
    
    func beginCountDown(){
        countDownLabel.text = "1:00"
        _ = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
    }
    
    func populateRandomText(){
        let myEvent = SendEvent().sendEvent()
        let historic_event = HistoricEvent(firstEvent: myEvent.firstEvent, secondEvent: myEvent.secondEvent, thirdEvent: myEvent.thirdEvent, fourthEvent: myEvent.fourthEvent)
        firstEventLabel.text = historic_event.firstEvent
        secondEventLabel.text  = historic_event.secondEvent
        thirdEventLabel.text = historic_event.thirdEvent
        fourthEventLabel.text = historic_event.fourthEvent
    }
    
    func update() {
        
        if(count > 0){
            let minutes = String(count / 60)
            let seconds = String(count % 60)
            countDownLabel.text = minutes + ":" + seconds
            count -= 1
        } else if count == 0 {
            // do suttin
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

