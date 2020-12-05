//
//  HandednessLearning.swift
//  handedness-detection
//
//  Created by Quentin Jeanningros on 18/11/2020.
//

import Foundation

//MARK: - HANDEDNESS DELEGATE

protocol HandednessDelegate {
    func onAction(hand: Handedness)
}

//MARK: - ENUM HANDEDNESS

enum Handedness
{
    case unknow
    case right
    case left
}

//MARK: - HANDEDNESS LEARNING

class HandednessLearning: DetectionDelegate
{
    public var delegate: HandednessDelegate? = nil

    //Ringbuffer
    private var rightCount: UInt = 0
    private var leftCount: UInt = 0

    private let size: Int
    private var array: [Handedness] = []
    private var index: Int = 0
    {
        didSet
        {
            index = index % size
        }
    }
    
    init(size: UInt)
    {
        self.size = Int(size)
        for _ in 0..<size
        {
            array.append(Handedness.unknow)
        }
    }
    
    func add(hand: Handedness)
    {
        if array[index] == Handedness.left
        {
            leftCount -= 1
        }
        else if array[index] == Handedness.right
        {
            rightCount -= 1
        }
        array[index] = hand
        index += 1
    }
    
    func getAverage() -> Handedness
    {
        if rightCount > leftCount
        {
            return Handedness.right
        }
        else if rightCount < leftCount
        {
            return Handedness.left
        }
        return Handedness.unknow
    }
    
    //Delegate
    func rightDetected()
    {
        add(hand: Handedness.right)
        rightCount += 1
        guard let delegate = delegate else { return }
        delegate.onAction(hand: getAverage())
    }
    
    func leftDetected()
    {
        add(hand: Handedness.left)
        leftCount += 1
        guard let delegate = delegate else { return }
        delegate.onAction(hand: getAverage())
    }
    
    func undefinedDetected()
    {
        add(hand: Handedness.unknow)
        guard let delegate = delegate else { return }
        delegate.onAction(hand: getAverage())
    }
}
