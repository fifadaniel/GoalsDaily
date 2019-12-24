//
//  ViewController.swift
//  ArtOfMovement
//
//  Created by Hyeong Kyun Park on 12/22/19.
//  Copyright © 2019 fifadaniel. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate {
    
    @IBOutlet weak var goalDesc: UILabel!
    @IBOutlet weak var category: UIPickerView!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var goalDisplay: UITextView!
    @IBOutlet weak var pickCategory: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var resultBox: UIView!
    @IBOutlet weak var todayLabel: UILabel!
    
    // Reset button empties all the goals saved.
    @IBAction func resetAll(_ sender: Any) {
        savedGoals = []
        tableView.reloadData()
    }
    
    // Random generation of goal
    @IBAction func generateButton(_ sender: Any) {
        switch (theCategory) {
            case "Random":
                let rand = Int.random(in:0...(goals.count-1))
                goalDisplay.text = goals[rand][Int.random(in: 0...(goals[rand].count-1))]
                break;
            case "Exercise":
                goalDisplay.text = goals[0][Int.random(in: 0...(goals[0].count-1))]
                break;
            case "Nutrition":
                goalDisplay.text = goals[1][Int.random(in: 0...(goals[1].count-1))]
                break;
            case "Challenge":
                goalDisplay.text = goals[2][Int.random(in: 0...(goals[2].count-1))]
                break;
            default:
                goalDisplay.text = "Pick a category or enter in your goal yourself!"
                break;
        }
    }
    
    // Saving goals
    @IBAction func saveButton(_ sender: Any) {
        if (goalDisplay.text != "Pick a category or enter in your goal yourself!") && (goalDisplay.text != "") && (!goalDisplay.text.isEmpty) {
            updateView()
        } else {
            goalDisplay.text = "Pick a category or enter in your goal yourself!"
        }
    }
    
    @IBOutlet weak var genButton: UIButton!
    @IBOutlet weak var savButton: UIButton!
    
    // Combinations
    
    var pickerData: [String] = ["(select catgory)", "Random", "Exercise", "Nutrition", "Challenge"]
    var goals: [[String]] = [["Run/Jog 1 mile!", "Run/Jog 2 miles!", "Run/Jog 3 miles!", "Go to the gym for 1 hour!", "Go to the gym for 2 hours!", "Walk 1 mile!", "Walk 2 miles!", "Walk 3 miles!", "Walk 4 miles!", "Walk 5 miles!", "Learn or practice a new sport!", "100 pushups!", "100 crunches!", "100 burpees!", "5 minutes of planking!", "200 jumping jacks!"],
                             ["Eat under 2000 calories!", "Eat breakfast!", "Drink 8 cups of water!", "No processed sugar today!", "Only fruit or veggie snacks!", "Don't eat past 8 pm!", "Don't eat out today!"],
                             ["Reach 15000 steps on the Health app!", "Drink 16 cups of water!", "Reach 20000 steps on the Health app!", "10 minutes of planking!", "300 pushups!", "300 crunches!", "300 burpees!", "10 minutes of planking!", "1000 jumping jacks!"]]
    
    var theCategory: String = ""
    var savedGoals: [String] = [String]()
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // code for picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        theCategory = pickerData[row]
    }
    
    // main
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.category.delegate = self
        self.category.dataSource = self
        
        // Cleaning up TableView
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        // DateTime display
        let dateCurrent = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([Calendar.Component.day, Calendar.Component.month, Calendar.Component.year], from: dateCurrent)
        todayLabel.text = "Goal for \(components.month!)/\(components.day!)/\(components.year!)"
        
        // Make TextView Visible
        goalDisplay.isScrollEnabled = true

        // UI Customization
        genButton.layer.borderColor = UIColor.gray.cgColor
        genButton.layer.borderWidth = 1.0
        savButton.layer.borderColor = UIColor.gray.cgColor
        savButton.layer.borderWidth = 1.0
        category.layer.borderColor = UIColor.gray.cgColor
        category.layer.borderWidth = 1.0
        category.layer.cornerRadius = pickCategory.frame.height / 4.0
        category.layer.backgroundColor = UIColor.white.cgColor
        pickCategory.layer.borderColor = UIColor.gray.cgColor
        pickCategory.layer.borderWidth = 1.0
        pickCategory.layer.cornerRadius = pickCategory.frame.height / 4.0
        pickCategory.layer.backgroundColor = UIColor.white.cgColor
        goalDisplay.layer.cornerRadius = goalDisplay.frame.height / 16.0
        goalDisplay.layer.borderColor = UIColor.gray.cgColor
        goalDisplay.layer.borderWidth = 1.0
        resultBox.layer.cornerRadius = resultBox.frame.height / 16.0
        resultBox.layer.borderWidth = 1.0
        resultBox.layer.borderColor = UIColor.gray.cgColor
        todayLabel.layer.borderWidth = 1.0
        todayLabel.layer.borderColor = UIColor.gray.cgColor
        todayLabel.layer.cornerRadius = todayLabel.frame.height / 4.0
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizer.Direction.left
        view.addGestureRecognizer(leftSwipe)
    }
    
    func updateView() {
        savedGoals.append(goalDisplay.text!)
        
        let indexPath = IndexPath(row: savedGoals.count - 1, section: 0)
        
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
        
        goalDisplay.text = ""
        view.endEditing(true)
    }
}

extension UIViewController {
    @objc func swipeAction(swipe:UISwipeGestureRecognizer) {
        switch swipe.direction.rawValue {
        case 1:
            performSegue(withIdentifier: "goLeft", sender: self)
        case 2:
            performSegue(withIdentifier: "goRight", sender: self)
        default:
            break
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedGoals.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let goalTitle = savedGoals[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "theCell") as! theCell
        cell.goalTitle.text = goalTitle
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            savedGoals.remove(at: indexPath.row)
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
}
