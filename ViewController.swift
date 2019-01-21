
//  InterView Question
//
//  Created by Souvik on 1/21/19.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        //Program for count of given string from file.
        print(readRTFFile(givenValue: "Cow"))

        //Program for remove dublicate value from array
        print(uniqueElementsFrom(array:["a", "b", "a", "c", "a", "d"]))
        
        //Program for reverse a string in n/2 order
        print(reverseString(value: "souvik"))
    }
    
    // Mark :- Program for count of given string from file.
    func readFile(givenValue : String) -> Int{
        var count = 0
        if let rtfPath = Bundle.main.url(forResource: "hello", withExtension: "rtf") {
            do {
                let attributedStringWithRtf: NSAttributedString = try NSAttributedString(url: rtfPath, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.rtf], documentAttributes: nil)
                let value = attributedStringWithRtf.string
                print(value)
                let array = value.components(separatedBy: " ")
                for item in array{
                    if item == givenValue{
                        count += 1
                    }
                    
                }
            } catch let error {
                print("Got an error \(error)")
            }
        }
        return count
        
    }
    
   
    func RemoveDublicateFrom(array: [String]) -> [String] {
        var set = Set<String>()
        let result = array.filter {
            guard !set.contains($0) else {
                return false
            }
            set.insert($0)
            return true
        }

        return result
    }
    
    //Reverse string in n/2 complixity
    func reverseString(value : String) -> String {
        var reverseItem : String = ""
        let array = Array(value)
        for index in 0..<(array.count/2){
            reverseItem = "\(array[index])" + reverseItem
        }
        return reverseItem + value.suffix(array.count/2)
    }
   
}

