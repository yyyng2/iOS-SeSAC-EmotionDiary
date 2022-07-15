//
//  ViewController.swift
//  EmotionDiary
//
//  Created by Y on 2022/07/15.
//

import UIKit

let userDefaults = UserDefaults.standard
var emotionArray = [0,0,0,0,0,0,0,0,0]

class ViewController: UIViewController {

    @IBOutlet weak var happyLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var loveLabel: UILabel!
    @IBOutlet weak var angryLabel: UILabel!
    @IBOutlet weak var stunLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var shockLabel: UILabel!
    @IBOutlet weak var upsetLabel: UILabel!
    @IBOutlet weak var cryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadEmotionArray()
        designEmotionCountLabel()
        
    }
    
    func loadEmotionArray(){
        
        for tag in 0...8{
            emotionArray[tag] = UserDefaults.standard.integer(forKey: "\(tag)")
        }
        
    }
    
    func designEmotionCountLabel(){

        happyLabel.text = "행복해 \(emotionArray[0])"
        likeLabel.text = "좋아해 \(emotionArray[1])"
        loveLabel.text = "사랑해 \(emotionArray[2])"
        angryLabel.text = "분노해 \(emotionArray[3])"
        stunLabel.text = "황당해 \(emotionArray[4])"
        blueLabel.text = "우울해 \(emotionArray[5])"
        shockLabel.text = "당황해 \(emotionArray[6])"
        upsetLabel.text = "불행해 \(emotionArray[7])"
        cryLabel.text = "슬퍼해 \(emotionArray[8])"
        
    }

    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        
        let currentValue = UserDefaults.standard.integer(forKey: "\(sender.tag)")
        let updateValue = currentValue + 1
        UserDefaults.standard.set(updateValue, forKey: "\(sender.tag)")
        emotionArray[sender.tag] += UserDefaults.standard.integer(forKey: "\(sender.tag)")
        loadEmotionArray()
        designEmotionCountLabel()
 
    }
    
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "\(sender.tag)")
        loadEmotionArray()
        designEmotionCountLabel()
    }
    
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        for tag in 0...8{
            UserDefaults.standard.removeObject(forKey: "\(tag)")
        }
        loadEmotionArray()
        designEmotionCountLabel()
    }
    

    
}

