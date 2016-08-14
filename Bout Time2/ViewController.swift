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
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var directionLabel1: UIButton!
    @IBOutlet weak var directionLabel2: UIButton!
    @IBOutlet weak var directionLabel3: UIButton!
    @IBOutlet weak var directionLabel4: UIButton!
    @IBOutlet weak var directionLabel5: UIButton!
    @IBOutlet weak var directionLabel6: UIButton!
    @IBOutlet weak var nextRoundOutlet: UIButton!
    
    var count = 59
    var keyDict: [Int]? = []
    var points = 0
    var timer = NSTimer()
    var roundsPlayed = 0
    var roundLimits = 6
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        hideElements()
    }
    
    func hideElements() {
        firstEventLabel.hidden = true
        secondEventLabel.hidden = true
        thirdEventLabel.hidden = true
        fourthEventLabel.hidden = true
        timerLabel.hidden = true
        shakeToComplete.hidden = true
        directionLabel1.hidden = true
        directionLabel2.hidden = true
        directionLabel3.hidden = true
        directionLabel4.hidden = true
        directionLabel5.hidden = true
        directionLabel6.hidden = true
        pointLabel.hidden = true
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    @IBAction func beginGame() {
        roundsPlayed += 1
        if roundsPlayed <= roundLimits {
            beginGameOutlet.hidden = true
            boutTimeText.hidden = true
            displayGame()
            count = 59
            beginCountDown()
            populateRandomText()
        } else {
            roundsPlayed = 0
            hideElements()
            beginGameOutlet.hidden = false
            pointLabel.hidden = false
        }
    }
    
    func displayGame(){
        firstEventLabel.hidden = false
        secondEventLabel.hidden = false
        thirdEventLabel.hidden = false
        fourthEventLabel.hidden = false
        timerLabel.hidden = false
        shakeToComplete.hidden = false
        directionLabel1.hidden = false
        directionLabel2.hidden = false
        directionLabel3.hidden = false
        directionLabel4.hidden = false
        directionLabel5.hidden = false
        directionLabel6.hidden = false
        pointLabel.hidden = true
    }
    
    func beginCountDown(){
        countDownLabel.text = "1:00"
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
    }
    
    func populateRandomText(){
        let myEvent = SendEvent().sendEvent()
            let historic_event = HistoricEvent(firstEvent: myEvent.firstEvent, secondEvent: myEvent.secondEvent, thirdEvent: myEvent.thirdEvent, fourthEvent: myEvent.fourthEvent, keyOfEvents: myEvent.keyDict)
            firstEventLabel.text = historic_event.firstEvent
            secondEventLabel.text  = historic_event.secondEvent
            thirdEventLabel.text = historic_event.thirdEvent
            fourthEventLabel.text = historic_event.fourthEvent
        keyDict = myEvent.keyDict
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            update(true)
        }
    }
    
    func update(shakeDetected: Bool) {
        
        if count < 0 || shakeDetected == true {
            timer.invalidate()
            checkResults()
            nextRoundOutlet.hidden = false
            shakeToComplete.hidden = true
        }else {
            let minutes = String(count / 60)
            let seconds = String(count % 60)
            countDownLabel.text = minutes + ":" + seconds
            count -= 1
        }
    }
    
    func checkResults(){
        if keyDict != nil {
            let firstKey = keyDict?.minElement()
            var roundPoints: Int = 0
            
            if firstKey != nil {
                if firstEventLabel.text == historicEventsDict[firstKey!] {
                    roundPoints += 1
                }
                let firstKeyIndex = keyDict?.indexOf(firstKey!)
                keyDict?.removeAtIndex(firstKeyIndex!)
            }
            
            let secondKey = keyDict?.minElement()
            if secondKey != nil {
                if secondEventLabel.text == historicEventsDict[secondKey!] {
                    roundPoints += 1
                }
                let secondKeyIndex = keyDict?.indexOf(secondKey!)
                keyDict?.removeAtIndex(secondKeyIndex!)
            }
            
            let thirdKey = keyDict?.minElement()
            if thirdKey != nil {
                if thirdEventLabel.text == historicEventsDict[thirdKey!] {
                    roundPoints += 1
                }
                let thirdKeyIndex = keyDict?.indexOf(thirdKey!)
                keyDict?.removeAtIndex(thirdKeyIndex!)
            }
            
            let fourthKey = keyDict?.minElement()
            if fourthKey != nil {
                if fourthEventLabel.text == historicEventsDict[fourthKey!] {
                    roundPoints += 1
                }
                let fourthKeyIndex = keyDict?.indexOf(fourthKey!)
                keyDict?.removeAtIndex(fourthKeyIndex!)
            }
            
            if roundPoints == 4 {
                updatePointLabel()
                let successImage: UIImage = UIImage(named: "next_round_success")!
                nextRoundOutlet.setBackgroundImage(successImage, forState: .Normal)
            } else {
                let failImage: UIImage = UIImage(named: "next_round_fail")!
              nextRoundOutlet.setBackgroundImage(failImage, forState: .Normal)
            }
        }
    }
    
    @IBAction func nextRound() {
        nextRoundOutlet.hidden = true
        shakeToComplete.hidden = false
        beginGame()
    }
    
    func updatePointLabel(){
        points += 1
        pointLabel.text = "Points: \(points)/6"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

