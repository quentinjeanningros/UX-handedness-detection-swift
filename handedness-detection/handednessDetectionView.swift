//
//  handednessDetectionView.swift
//  handedness-detection
//
//  Created by Quentin Jeanningros on 15/11/2020.
//

import UIKit

//MARK: - WHEEL MODEL DELEGATE

protocol DetectionDelegate
{
    func rightDetected()
    func leftDetected()
    func undefinedDetected()
}

//MARK: - DETECTION VIEW

class HandednessDetectionView: UIView
{
    public var delegate: DetectionDelegate? = nil
    private var startingPoint: CGPoint? = nil
    
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
        else if let delegate = self.delegate
        {
            delegate.undefinedDetected()
        }
        startingPoint = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if let start = startingPoint, let touch = touches.first
        {
            guessHandedness(start: start, end: touch.location(in: self))
        }
        else if let delegate = self.delegate
        {
            delegate.undefinedDetected()
        }
        startingPoint = nil
    }

    func guessHandedness(start: CGPoint, end: CGPoint)
    {
        guard let delegate = delegate else { return }
        if start.x > end.x
        {
            delegate.leftDetected()
        }
        else if start.x < end.x
        {
            delegate.rightDetected()
        }
        else
        {
            delegate.undefinedDetected()
        }
    }
    
}
