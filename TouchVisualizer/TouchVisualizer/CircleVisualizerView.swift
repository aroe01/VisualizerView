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
    fileprivate var colorVal : UIColor = UIColor.purple
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(_ value: CGFloat) {
//        self.radiusConstraint?.constant = value
        self.radius = value / 2
        self.setNeedsDisplay()
    }
    func update(_ value: CGFloat, colorToggle : Int){
        self.colorVal = colorToggle == 1 ? UIColor.purple : UIColor.white
        self.update(value)
    }
    override func draw(_ rect: CGRect) {
//        self.path = UIBezierPath(arcCenter: <#T##CGPoint#>, radius: <#T##CGFloat#>, startAngle: <#T##CGFloat#>, endAngle: <#T##CGFloat#>, clockwise: <#T##Bool#>)
        
        self.path = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2), radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
//        self.layer.anchorPoint
//        self.path = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width/2 - self.frame.size.height/2, y: 0.0, width: radius, height: radius))
//        UIColor.purple.setFill()
        self.colorVal.setFill()
        self.path.fill()
            
    }
    
}
