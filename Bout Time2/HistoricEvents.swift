//
//  HistoricEvents.swift
//  Bout Time2
//
//  Created by Just Fuad on 10/08/2016.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation


var historicEventsDict: [Int: String] = [1: "Beggining of World War One", 20: "September 11 attacks", 25: "Britain votes to Leave EU", 24: "Murder of Lee Rigby", 23: "Dr. cebi cures aid patient", 22: "Four terrorists explode bombs on London Transport", 21: "Queen Elizabeth's Mother dies", 19: "First Big Brother show", 18: "Britain hands Hong Kong back to China", 17: "King Fuad Adetoro was born", 13: "Fall of Barrings Bank", 16: "John Major gets on his Soapbox", 15: "IRA Bombs Warrington", 14: "Tony Blair Elected Labour Leader", 12: "1st Red Nose day", 11: "Titanic Found", 10: "Greatest Underground Fire in History", 9: "IRA bomb Harrods", 8: "Brixton riots", 7: "World's first £1millon footballer bought", 6: "Apple Computers Launched", 5: "Microsoft founded", 4: "IRA bomb Birmingham", 3: "Belfast bar bomb kills 15", 2:"Manchester United win first European championship"]


struct SendEvent {
    func sendEvent() -> (firstEvent: String?, secondEvent: String?, thirdEvent: String?, fourthEvent: String?, keyDict: [Int]?){
        let firstIndex = Int(arc4random_uniform(UInt32(historicEventsDict.count)))
        var secondIndex = Int(arc4random_uniform(UInt32(historicEventsDict.count)))
        var thirdIndex = Int(arc4random_uniform(UInt32(historicEventsDict.count)))
        var fourthIndex = Int(arc4random_uniform(UInt32(historicEventsDict.count)))
        
        repeat {
            secondIndex = Int(arc4random_uniform(UInt32(historicEventsDict.count)))
        } while secondIndex == firstIndex;
        
        repeat {
            thirdIndex = Int(arc4random_uniform(UInt32(historicEventsDict.count)))
        } while thirdIndex == secondIndex;
        
        repeat {
            fourthIndex = Int(arc4random_uniform(UInt32(historicEventsDict.count)))
        } while fourthIndex == thirdIndex;
        
        
        let keyDict = [firstIndex, secondIndex, thirdIndex, fourthIndex]
        
        
        return (historicEventsDict[firstIndex], historicEventsDict[secondIndex],  historicEventsDict[thirdIndex], historicEventsDict[fourthIndex],
        keyDict)
    }
}

class HistoricEvent {
    var firstEvent: String?
    var secondEvent: String?
    var thirdEvent: String?
    var fourthEvent: String?
    var keyOfEvents: [Int]?
    
    init(firstEvent: String?, secondEvent: String?, thirdEvent: String?, fourthEvent: String?, keyOfEvents: [Int]?){
        self.firstEvent = firstEvent
        self.secondEvent = secondEvent
        self.thirdEvent = thirdEvent
        self.fourthEvent = fourthEvent
        self.keyOfEvents = keyOfEvents
    }
}


























