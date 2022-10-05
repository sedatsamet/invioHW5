//
//  ViewController.swift
//  invioHW5
//
//  Created by Sedat Samet Oypan on 4.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonAC: UIButton!
    @IBOutlet weak var buttonPosNeg: UIButton!
    @IBOutlet weak var buttonPerc: UIButton!
    @IBOutlet weak var buttonDivide: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var buttonMultiply: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var buttonSubstract: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var buttonSum: UIButton!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var buttonComma: UIButton!
    @IBOutlet weak var buttonEqual: UIButton!
    @IBOutlet weak var calculationLabel: UILabel!
    @IBOutlet weak var previousLabel: UILabel!
    
    var buttonList = [UIButton]()
    var userInput:String?
    var previousValue:String?
    var sum = 0
    var nums = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeItCircle(buttonList: makeAList())
        calculationLabel.text = "0"
        previousLabel.text = ""
    }
    
    @IBAction func button0(_ sender: Any) {
        handleInput(inputStr: "0")
    }
    @IBAction func button1(_ sender: Any) {
        handleInput(inputStr: "1")
    }
    
    @IBAction func button2(_ sender: Any) {
        handleInput(inputStr: "2")
    }
    
    @IBAction func button3(_ sender: Any) {
        handleInput(inputStr: "3")
    }
    
    @IBAction func button4(_ sender: Any) {
        handleInput(inputStr: "4")
    }
    
    @IBAction func button5(_ sender: Any) {
        handleInput(inputStr: "5")
    }
    
    @IBAction func button6(_ sender: Any) {
        handleInput(inputStr: "6")
    }
    
    @IBAction func button7(_ sender: Any) {
        handleInput(inputStr: "7")
    }
    
    @IBAction func button8(_ sender: Any) {
        handleInput(inputStr: "8")
    }
    
    @IBAction func button9(_ sender: Any) {
        handleInput(inputStr: "9")
    }
    
    @IBAction func buttonAC(_ sender: Any) {
        previousValue = ""
        previousLabel.text = ""
        calculationLabel.text = "0"
        sum = 0
        nums.removeAll()
    }
    
    @IBAction func buttonSum(_ sender: Any) {
        if let input = calculationLabel.text {
            previousLabel.text! += " \(input) + "
            calculationLabel.text = "0"
            userInput = "+"
            nums.append(Int(input)!)
        }
    }
    
    @IBAction func buttonEqual(_ sender: Any) {
        if let inputOp = userInput {
            calculation(operationInput: inputOp )
        }
    }
}

extension ViewController {
    func makeAList() -> [UIButton]{
        buttonList.append(buttonAC)
        buttonList.append(buttonPosNeg)
        buttonList.append(buttonPerc)
        buttonList.append(buttonDivide)
        buttonList.append(button7)
        buttonList.append(button8)
        buttonList.append(button9)
        buttonList.append(buttonMultiply)
        buttonList.append(button4)
        buttonList.append(button5)
        buttonList.append(button6)
        buttonList.append(buttonSubstract)
        buttonList.append(button1)
        buttonList.append(button2)
        buttonList.append(button3)
        buttonList.append(buttonSum)
        buttonList.append(buttonComma)
        buttonList.append(buttonEqual)
        return buttonList
    }
    func makeItCircle(buttonList:[UIButton]) {
        for button in buttonList {
            button.layer.cornerRadius = 0.5 * button.bounds.size.width
            button.clipsToBounds = true
        }
        button0.layer.cornerRadius = 30
        button0.clipsToBounds = true
    }
    
    func handleInput(inputStr:String){
        if calculationLabel.text == "0"{
            calculationLabel.text = ""
            calculationLabel.text! += inputStr
        }else{
            calculationLabel.text! += inputStr
        }
    }
    
    func calculation(operationInput:String){
        if operationInput == "+" {
            for num in nums {
                sum += num
            }
            sum += Int(calculationLabel.text!)!
            if calculationLabel.text == "0" {
                previousLabel.text! += "\n = "
            }else {
                previousLabel.text! += calculationLabel.text! + "\n = "
            }
            calculationLabel.text = String(sum)
            sum = 0
            nums.removeAll()
        }
    }
}
