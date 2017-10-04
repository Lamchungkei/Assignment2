// Created by: Kay Lin
// Created on: 02-Oct-2017
// Created for: ICS3U
// This program calculates the height of the object above the ground in meters, given the time

import PlaygroundSupport

import UIKit

class ViewController : UIViewController, UITextFieldDelegate {
    // this is the main view controller, that will show the UIKit elements
    
    // properties
    var timeLabel : UILabel!
    var answerLabel : UILabel!
    var timeTextField : UITextField!
    var calculateButton : UIButton!
    
    override func viewDidLoad() {
        // UI
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view = view
        
        //timeLabel
        timeLabel = UILabel()
        timeLabel.text = "Enter the number of seconds that has passed"
        view.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        //timeBox
        timeTextField = UITextField()
        timeTextField.bounds = CGRect(x: 0, y: 0, width: view.bounds.width / 2, height: 50)
        timeTextField.backgroundColor = UIColor.lightGray
        timeTextField.borderStyle = UITextBorderStyle.roundedRect
        timeTextField.font = UIFont.systemFont(ofSize: 17)
        timeTextField.textAlignment = .center
        timeTextField.placeholder = "Enter Time"
        timeTextField.clearButtonMode = UITextFieldViewMode.whileEditing
        timeTextField.delegate = self
        view.addSubview(timeTextField)
        timeTextField.translatesAutoresizingMaskIntoConstraints = false
        timeTextField.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 20).isActive = true
        timeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        // calculate button
        calculateButton = UIButton()
        calculateButton.setTitle("Calculate", for: .normal)
        calculateButton.setTitleColor(.blue, for: .normal)
        calculateButton.addTarget(self, action: #selector(heightText), for: .touchUpInside)
        view.addSubview(calculateButton)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.topAnchor.constraint(equalTo: timeTextField.bottomAnchor, constant: 20).isActive = true
        calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        // answerLabel
        answerLabel = UILabel()
        
        // answerLabel.text = "the height is " + "" + " m"
        
        view.addSubview(answerLabel)
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20).isActive = true
        answerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
    }
    
    @objc func heightText() {
        var time = Float(timeTextField.text!)
        let g = Float(9.81)
        let height = 100.0 - 0.5 * g * (pow(Float((time)!),2))
        
        answerLabel.text = "The height is " + String(height) + " m"
        if height < 0 {
            self.answerLabel.text = "Height cannot be negative"
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true 
    }
}

PlaygroundPage.current.liveView = ViewController()



