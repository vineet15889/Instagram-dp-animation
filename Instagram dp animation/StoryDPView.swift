//
//  StoryDPView.swift
//  Instagram dp animation
//
//  Created by Vineet Rai on 08/05/21.
//

import UIKit

class StoryDPView: UIView {
    
    let shapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    
    func setupForStory(image:UIImage){
        
        self.clipsToBounds = true
        self.layer.cornerRadius = self.bounds.height / 2
        
        // SetupImage
        self.setupStoryImage(image: image)
        // Draw track
        self.drawGrayTrack()
        // Draw gradient track
        self.drawGradientTrack()
        // Gradient Layer
        self.drawGradient()
        // tap action
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    private func setupStoryImage(image:UIImage){
        let profileImageView = UIImageView(image: image)
        profileImageView.bounds = CGRect(x: 0, y: 0, width:  self.frame.size.width - 15, height: self.frame.size.height - 15)
        profileImageView.contentMode = UIView.ContentMode.scaleAspectFill
        profileImageView.image = image
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = (self.bounds.height - 10) / 2
        profileImageView.center = self.center
        self.addSubview(profileImageView)
        profileImageView.center = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
    }
    
    private func drawGrayTrack(){
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2), radius: self.frame.width/2, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 3
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        self.layer.addSublayer(trackLayer)
    }
    
    private func drawGradientTrack(){
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2), radius: self.frame.width/2, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 3
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeEnd = 0
        self.layer.addSublayer(shapeLayer)
    }
    
    private func drawGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.colors = [
            UIColor.orange.cgColor,
            UIColor.red.cgColor,
            UIColor.purple.cgColor,
            UIColor.blue.cgColor
        ]
        gradientLayer.frame = self.bounds
        self.layer.addSublayer(gradientLayer)
        gradientLayer.mask = shapeLayer
    }
    
    // Animation on click
    @objc private func handleTap() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = true
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }
}
