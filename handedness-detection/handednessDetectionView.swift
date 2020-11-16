//
//  handednessDetectionView.swift
//  handedness-detection
//
//  Created by Quentin Jeanningros on 15/11/2020.
//

import UIKit

class handednessDetectionView: UIView
{
    var label: UILabel?
    private var startingPoint: CGPoint? = nil

    func updateText(text: String)
    {
        guard let l = self.label else {return}
        l.text = text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if let touch = touches.first
        {
            startingPoint = touch.location(in: self)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if let start = startingPoint, let touch = touches.first
        {
            guessHandedness(start: start, end: touch.location(in: self))
        }
        else
        {
            self.updateText(text: "🤔")
        }
        startingPoint = nil
    }
    

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if let start = startingPoint, let touch = touches.first
        {
            guessHandedness(start: start, end: touch.location(in: self))
        }
        else
        {
            self.updateText(text: "🤔")
        }
        startingPoint = nil
    }

    func guessHandedness(start: CGPoint, end: CGPoint)
    {
        if start.x > end.x
        {
            self.updateText(text: "👈")
        }
        else if start.x < end.x
        {
            self.updateText(text: "👉")
        }
        else
        {
            self.updateText(text: "🤔")
        }
    }
    
    
}
