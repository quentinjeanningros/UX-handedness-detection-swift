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
    @IBOutlet var handednessDetectionView: handednessDetectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        handednessDetectionView.label = label
    }


}

