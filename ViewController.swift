
//  InterView Question
//
//  Created by Souvik on 1/21/19.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        // Mark :- Program for count of given string from file.
        print(readRTFFile(givenValue: "Cow"))

        //Program for remove dublicate value from array
        print(uniqueElementsFrom(array:["a", "b", "a", "c", "a", "d"]))
        
        //Program for reverse a string in n/2 order
        print(reverseString(value: "souvik"))
    }
    
    
    func readRTFFile(givenValue : String) -> Int{
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
    
   
    func uniqueElementsFrom(array: [String]) -> [String] {
        //Create an empty Set to track unique items
        var set = Set<String>()
        let result = array.filter {
            guard !set.contains($0) else {
                //If the set already contains this object, return false
                //so we skip it
                return false
            }
            //Add this item to the set since it will now be in the array
            set.insert($0)
            //Return true so that filtered array will contain this item.
            return true
        }

        return result
    }
    
    
    func reverseString(value : String) -> String {
        var reverseItem : String = ""
        //Create empty string
        let array = Array(value)
        //Convert string to array
        for index in 0..<(array.count/2){
            reverseItem = "\(array[index])" + reverseItem
        }
        //Store reverse item n/2 complixity

        
        return reverseItem + value.suffix(array.count/2)
    }
    
    
    @IBAction func actionResult(_ sender: Any) {
        print(self.reverseString(value: "BumbleBee1"))
    }
    
    
}

