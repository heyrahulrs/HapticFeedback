//
//  ViewController.swift
//  HapticFeedback
//
//  Created by Rahul Sharma on 5/17/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let feedbackSupportLevel = UIDevice.current.value(forKey: "_feedbackSupportLevel") as? Int ?? 1
        let isHapticAvailable = feedbackSupportLevel == 2
        
        if !isHapticAvailable {
            
            buttons.forEach { $0.isEnabled = false }

            let alert = UIAlertController(title: "Haptic Feedback not available!", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            
            alert.addAction(action)
            present(alert, animated: true)
        }
        
    }
    
    @IBAction func didTapImpactFeedbackGenerator(_ sender: UIButton){
        let style = UIImpactFeedbackGenerator.FeedbackStyle(rawValue: sender.tag)
        let impactFeedbackGenerator = UIImpactFeedbackGenerator(style: style ?? .medium)
        impactFeedbackGenerator.prepare()
        impactFeedbackGenerator.impactOccurred()
    }
    
    @IBAction func didTapSelectionFeedbackGeneratorButton(){
        let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
        selectionFeedbackGenerator.prepare()
        selectionFeedbackGenerator.selectionChanged()
    }
    
    @IBAction func didTapNotificationFeedbackGenerator(_ sender: UIButton){
        let style = UINotificationFeedbackGenerator.FeedbackType(rawValue: sender.tag)
        let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
        notificationFeedbackGenerator.prepare()
        notificationFeedbackGenerator.notificationOccurred(style ?? .success)
    }


}

