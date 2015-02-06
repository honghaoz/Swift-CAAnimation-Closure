//
//  ViewController.swift
//  CAAnimation+Closures Demo
//
//  Created by Honghao Zhang on 2/5/15.
//  Copyright (c) 2015 Honghao Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var stateLabel: UILabel!
    var circleLayer: CAShapeLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stateLabel.text = "Ready"
    }
    
    override func viewDidLayoutSubviews() {
        // Here the bounds of circleView is ready
        setupCircleLayer()
        super.viewDidLayoutSubviews()
    }
    
    func setupCircleLayer() {
        // Setup circleLayer only once
        if circleLayer == nil {
            
            let lineWidth: CGFloat = 20.0
            
            // Setup path
            let arcCenter: CGPoint = CGPointMake(CGRectGetMidX(circleView.bounds), CGRectGetMidY(circleView.bounds))
            let radius: CGFloat = fmin(CGRectGetMidX(circleView.bounds), CGRectGetMidY(circleView.bounds)) - lineWidth / 2.0
            let circlePath = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: degreeToRadian(-90.0), endAngle: degreeToRadian(-90 + 360.0), clockwise: true)
            
            // Add layer
            circleLayer = CAShapeLayer()
            circleView.layer.addSublayer(circleLayer)
            circleLayer.path = circlePath.CGPath
            circleLayer.fillColor = UIColor.clearColor().CGColor
            circleLayer.lineWidth = lineWidth
            circleLayer.strokeColor = UIColor.blueColor().colorWithAlphaComponent(0.5).CGColor
            
            circleLayer.strokeStart = 0.0
            circleLayer.strokeEnd = 1.0
        }
    }
    
    @IBAction func animate(sender: AnyObject) {
        // Animation
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.duration = 2.0
        strokeEndAnimation.fromValue = 0.0
        strokeEndAnimation.toValue = 1.0
        strokeEndAnimation.autoreverses = false
        strokeEndAnimation.repeatCount = 0.0
        strokeEndAnimation.start = {
            println("Woo, the animation starts!")
            self.stateLabel.text = "Animating"
        }
        strokeEndAnimation.completion = { finished in
            println("Awesome, the animation just finished! :)")
            self.stateLabel.text = "Finished"
        }
        circleLayer.addAnimation(strokeEndAnimation, forKey: "strokeEndAnimation")
        
        // Handy method
//        circleLayer.addAnimationWithCompletion(strokeEndAnimation, forKey: "strokeEndAnimation", withCompletion: {finished in
//            println("Animation is finished")
//        })
    }
}

// MARK: Helper functions
func degreeToRadian(degree: CGFloat) -> CGFloat {
    return CGFloat(M_PI / 180) * degree
}

