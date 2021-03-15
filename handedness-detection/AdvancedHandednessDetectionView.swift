//
//  AdvancedHandednessDetectionView.swift
//  handedness-detection
//
//  Created by Quentin Jeanningros on 19/12/2020.
//

import UIKit

class AdvancedHandednessDetectionView: UIView {

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
    
//    func startGyros() {
//       if motion.isGyroAvailable {
//          self.motion.gyroUpdateInterval = 1.0 / 60.0
//          self.motion.startGyroUpdates()
//
//          // Configure a timer to fetch the accelerometer data.
//          self.timer = Timer(fire: Date(), interval: (1.0/60.0),
//                 repeats: true, block: { (timer) in
//             // Get the gyro data.
//             if let data = self.motion.gyroData {
//                let x = data.rotationRate.x
//                let y = data.rotationRate.y
//                let z = data.rotationRate.z
//
//                // Use the gyroscope data in your app.
//             }
//          })
//
//          // Add the timer to the current run loop.
//          RunLoop.current.add(self.timer!, forMode: .defaultRunLoopMode)
//       }
//    }
//
//    func stopGyros() {
//       if self.timer != nil {
//          self.timer?.invalidate()
//          self.timer = nil
//
//          self.motion.stopGyroUpdates()
//       }
//    }
    
}
