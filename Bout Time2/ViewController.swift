//
//  ViewController.swift
//  Bout Time2
//
//  Created by Just Fuad on 10/08/2016.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstEventLabel: UILabel!
    @IBOutlet weak var secondEventLabel: UILabel!
    @IBOutlet weak var thirdEventLabel: UILabel!
    @IBOutlet weak var fourthEventLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
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
        let myEvent = SendEvent().sendEvent()
        let historic_event = HistoricEvent(firstEvent: myEvent.firstEvent, secondEvent: myEvent.secondEvent, thirdEvent: myEvent.thirdEvent, fourthEvent: myEvent.fourthEvent)
        firstEventLabel.text = historic_event.firstEvent
        secondEventLabel.text  = historic_event.secondEvent
        thirdEventLabel.text = historic_event.thirdEvent
        fourthEventLabel.text = historic_event.fourthEvent
        
        //var timer = NSTimer(timeInterval: 0.5, target: self, selector: Selector("update"), userInfo: nil, repeats: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

