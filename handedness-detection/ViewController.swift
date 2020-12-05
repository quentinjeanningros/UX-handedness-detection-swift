//
//  ViewController.swift
//  handedness-detection
//
//  Created by Quentin Jeanningros on 15/11/2020.
//

import UIKit

class ViewController: UIViewController, HandednessDelegate
{
    func onAction(hand: Handedness) {
        if (hand == Handedness.left)
        {
            label.text = "👈"
        }
        else if (hand == Handedness.right)
        {
            label.text = "👉"
        }
        else
        {
            label.text = "🤔"
        }
    }
    

    @IBOutlet weak var label: UILabel!
    @IBOutlet var handednessDetectionView: HandednessDetectionView!
    var learning: HandednessLearning = HandednessLearning(size: 5)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        handednessDetectionView.delegate = learning
        learning.delegate = self
    }
    
}
