//
//  ViewController.swift
//  closures_learning
//
//  Created by dev09 on 17/08/17.
//  Copyright © 2017 dev09. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var doGreet = { (name: String) -> String in
        return "hello  \(name)" }
    
    let names = ["golu","sonu","pappu","aman"]
    
    let digitNames = [
        0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
        5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
    ]
    let numbers = [16, 58, 510]
    
    var completionHandlers: [() -> Void] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(doGreet("Rajat"))
        print(doGreet("iOS"))
        
        //     var reversedNames = names.sorted(by: { (s1:String, s2:String)->Bool in
        //        return s1>s2
        //     })
        
        //  let reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
        
        //  let reversedNames = names.sorted(by: { $0 > $1 } )
        
        // shortest form
        let   reversedNames = names.sorted(by: >)
        print("names in reversed order are \(reversedNames)")
        
        //closure for conversion
        
        let strings = numbers.map { (number) -> String in
            var number = number
            var output = ""
            repeat {
                output = digitNames[number % 10]! + output
                number /= 10
            } while number > 0
            return output
        }
        print("numbers in string format \(strings) \n")
        
        //for nesting of functions + closures
      //  let incrementByTen = makeIncrementer(forIncrement: 10)
      //  print("increment is  \(incrementByTen)")
        
        let incrementByTen = makeIncrementer(forIncrement: 10)
        print("first increment is \(incrementByTen())")
        print("second increment is \(incrementByTen())")
        print("third increment is \(incrementByTen())")
        print("fourth increment is \(incrementByTen())")
        
        print("\n")

        let incrementBySeven = makeIncrementer(forIncrement: 7)
        print("first increment is \(incrementBySeven())")
        print("second increment is \(incrementBySeven())")
        print("third increment is \(incrementBySeven())")

        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // nesting of functions
    func makeIncrementer(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        func incrementer() -> Int {
            runningTotal += amount
            return runningTotal
        }
        return incrementer
    }
    
    // for escaping closure
    func someFunctionWithEscapingclosure(completionhandler: @escaping () -> Void)   {
        completionHandlers.append (completionhandler)
        }
    
    func someFunctionWithNonescapingClosure(closure: () -> Void) {
        closure()
    }
    
}



