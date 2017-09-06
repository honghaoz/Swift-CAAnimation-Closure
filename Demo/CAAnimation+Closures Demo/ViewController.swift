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
            let arcCenter: CGPoint = CGPoint(x: circleView.bounds.midX, y: circleView.bounds.midY)
            let radius: CGFloat = fmin(circleView.bounds.midX, circleView.bounds.midY) - lineWidth / 2.0
            let circlePath = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: degreeToRadian(-90.0), endAngle: degreeToRadian(-90 + 360.0), clockwise: true)
            
            // Add layer
            circleLayer = CAShapeLayer()
            circleView.layer.addSublayer(circleLayer)
            circleLayer.path = circlePath.cgPath
            circleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.lineWidth = lineWidth
            circleLayer.strokeColor = UIColor.blue.withAlphaComponent(0.5).cgColor
            
            circleLayer.strokeStart = 0.0
            circleLayer.strokeEnd = 1.0
        }
    }
    
    @IBAction func animate(_ sender: AnyObject) {
        // Animation
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.duration = 2.0
        strokeEndAnimation.fromValue = 0.0
        strokeEndAnimation.toValue = 1.0
        strokeEndAnimation.autoreverses = false
        strokeEndAnimation.repeatCount = 0.0
        
        strokeEndAnimation.start = { [unowned self] in
            print("Woo, the animation starts!")
            self.stateLabel.text = "Animating"
        }
        
        strokeEndAnimation.animating = { progress in
            print("progress: \(progress)")
        }
                
        strokeEndAnimation.completion = { [unowned self] finished in
            print("Awesome, the animation just finished! :)")
            self.stateLabel.text = "Finished"
        }
        
        circleLayer.add(strokeEndAnimation, forKey: "strokeEndAnimation")
		
        // Handy method
//		circleLayer.addAnimation(strokeEndAnimation, forKey: "strokeEndAnimation") { finished in
//			print("Animation is finished")
//		}
    }
}

// MARK: Helper functions
func degreeToRadian(_ degree: CGFloat) -> CGFloat {
    return CGFloat(Double.pi / 180) * degree
}

