 // Created by: Kay Lin
 // Created on: Oct 2nd 2017
 // Created for: ICS3U
 // This program calculates the height of the object above the ground,
 // when you give it the time
 
 import PlaygroundSupport
 import UIKit
 
 class ViewController : UIViewController, UITextFieldDelegate {
    // this is the main view controller, that will show the UIKit elements
    
    // properties
    var timeLabel : UILabel!
    var answerLabel : UILabel!
    var timeBox : UITextField!
    var calculateButton : UIButton!
    
    override func viewDidLoad() {
        // UI
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view = view
        
            //timeLabel
        timeLabel = UILabel()
        timeLabel.text = "Enter the number of second  "
        view.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        //timeBox
        timeBox = UITextField()
        timeBox.bounds = CGRect(x: 0, y: 0, width: view.bounds.width / 2, height: 50)
        timeBox.backgroundColor = UIColor.lightGray
        timeBox.borderStyle = UITextBorderStyle.roundedRect
        timeBox.font = UIFont.systemFont(ofSize: 17)
        timeBox.textAlignment = .center
        timeBox.placeholder = "insert time"
        timeBox.clearButtonMode = UITextFieldViewMode.whileEditing
        
        timeBox.delegate = self
        view.addSubview(timeBox)
        timeBox.translatesAutoresizingMaskIntoConstraints = false
        timeBox.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 20).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        // calculate button
        calculateButton = UIButton()
        calculateButton.setTitle("Calculate", for: .normal)
        calculateButton.setTitleColor(.blue, for: .normal)
        calculateButton.addTarget(self, action: #selector(heightText), for: .touchUpInside)
        view.addSubview(calculateButton)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.topAnchor.constraint(equalTo: timeBox.bottomAnchor, constant: 20).isActive = true
        calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        // answerLabel
        answerLabel = UILabel()
        
        // answerLabel.text = "the height is " + "" + " m"
        
        view.addSubview(answerLabel)
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20).isActive = true
        answerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
    }
    
    func heightText() {
        //
        var time = Float(timeBox.text!)
        let g = Float(9.81)
        var height = 100.0 - 0.5 * g * (pow((time)!,2))
        
        answerLabel.text = "The height is " + String(height) + " m"
    }
    
    
    
        override var prefersStatusBarHidden: Bool {
            return true
        }
    }
    
    // this will be commented out when code moved to Xcode
    PlaygroundPage.current.liveView = ViewController()
 
