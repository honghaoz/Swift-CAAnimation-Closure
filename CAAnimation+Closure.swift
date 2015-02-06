//
//  CAAnimation+Closure.swift
//  CAAnimation+Closures
//
//  Created by Honghao Zhang on 2/5/15.
//  Copyright (c) 2015 Honghao Zhang. All rights reserved.
//

import QuartzCore

/**
*  CAAnimation Delegation class implementation
*/
class ZHCAAnimationDelegate: NSObject {
    /// start: A block (closure) object to be executed when the animation starts. This block has no return value and takes no argument.
    var start: (Void -> Void)?
    
    /// completion: A block (closure) object to be executed when the animation ends. This block has no return value and takes a single Boolean argument that indicates whether or not the animations actually finished.
    var completion: (Bool -> Void)?
    
    /**
    Called when the animation begins its active duration.
    
    :param: theAnimation the animation about to start
    */
    override func animationDidStart(theAnimation: CAAnimation) {
        start?()
    }
    
    /**
    Called when the animation completes its active duration or is removed from the object it is attached to.
    
    :param: theAnimation the animation about to end
    :param: finished     A Boolean value indicates whether or not the animations actually finished.
    */
    override func animationDidStop(theAnimation: CAAnimation, finished: Bool) {
        completion?(finished)
    }
}

extension CAAnimation {
    // Add start and completion property for CAAnimation Class
    /// start: A block (closure) object to be executed when the animation starts. This block has no return value and takes no argument.
    var start: (Void -> Void)? {
        set {
            if self.delegate == nil || !self.delegate!.isKindOfClass(ZHCAAnimationDelegate) {
                self.delegate = ZHCAAnimationDelegate()
            }
            (self.delegate! as ZHCAAnimationDelegate).start = newValue
        }
        
        get {
            if (self.delegate != nil) && self.delegate.isKindOfClass(ZHCAAnimationDelegate) {
                return (self.delegate as ZHCAAnimationDelegate).start
            }
            return nil
        }
    }
    
    /// completion: A block (closure) object to be executed when the animation ends. This block has no return value and takes a single Boolean argument that indicates whether or not the animations actually finished.
    var completion: (Bool -> Void)? {
        set {
            if self.delegate == nil || !self.delegate!.isKindOfClass(ZHCAAnimationDelegate) {
                self.delegate = ZHCAAnimationDelegate()
            }
            (self.delegate! as ZHCAAnimationDelegate).completion = newValue
        }
        
        get {
            if (self.delegate != nil) && self.delegate!.isKindOfClass(ZHCAAnimationDelegate) {
                return (self.delegate as ZHCAAnimationDelegate).completion
            }
            return nil
        }
    }
}

extension CALayer {
    /**
    Add the specified animation object to the layer’s render tree. Could provide a completion closure.
    
    :param: anim       The animation to be added to the render tree. This object is copied by the render tree, not referenced. Therefore, subsequent modifications to the object are not propagated into the render tree.
    :param: key        A string that identifies the animation. Only one animation per unique key is added to the layer. The special key kCATransition is automatically used for transition animations. You may specify nil for this parameter.
    :param: completion A block object to be executed when the animation ends. This block has no return value and takes a single Boolean argument that indicates whether or not the animations actually finished before the completion handler was called. Default value is nil.
    */
    func addAnimationWithCompletion(anim: CAAnimation!, forKey key: String!, withCompletion completion: (Bool -> Void)? = nil) {
        anim.completion = completion
        self.addAnimation(anim, forKey: key)
    }
}
