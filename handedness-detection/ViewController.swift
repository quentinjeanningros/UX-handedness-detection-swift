//
//  ViewController.swift
//  handedness-detection
//
//  Created by Quentin Jeanningros on 15/11/2020.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var label: UILabel!
    @IBOutlet var handednessDetectionView: HandednessDetectionView!
    var delegate: HandednessLearning = HandednessLearning(size: 5)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        handednessDetectionView.delegate = delegate
    }
    
}
