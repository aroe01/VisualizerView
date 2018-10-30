//
//  CircleVisualizerView.swift
//  TouchVisualizer
//
//  Created by Adrian Roe on 10/30/18.
//  Copyright © 2018 Adrian. All rights reserved.
//

import UIKit

class CircleVisualizerView : VisualizerView{
    
    var path : UIBezierPath!
    
//    @IBOutlet weak var radiusConstraint : NSLayoutConstraint?
    fileprivate var radius : CGFloat = 100
    
    override func update(_ value: CGFloat) {
//        self.radiusConstraint?.constant = value
        self.radius = value / 2
        self.setNeedsDisplay()
    }
    override func draw(_ rect: CGRect) {
//        self.path = UIBezierPath(arcCenter: <#T##CGPoint#>, radius: <#T##CGFloat#>, startAngle: <#T##CGFloat#>, endAngle: <#T##CGFloat#>, clockwise: <#T##Bool#>)
        
        self.path = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2), radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
//        self.path = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width/2 - self.frame.size.height/2, y: 0.0, width: radius, height: radius))
        UIColor.purple.setFill()
        self.path.fill()
        
    }
}
