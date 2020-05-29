//
//  PowerButton.swift
//  FlashLight
//
//  Created by Zachary Johnson on 5/4/20.
//  Copyright © 2020 Zachary Johnson. All rights reserved.
//

import UIKit

public class PowerButton : UIButton
{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton()
    {
        setShadow()
        setTitleColor(.white, for: .normal)
        setTitle("Button", for: .normal)
        
        backgroundColor = UIColor.lightGray
        titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        layer.cornerRadius = 62
    }
    
    private func setShadow()
    {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width:0.0 , height:6.0)
        layer.shadowRadius = 8.0
        layer.shadowOpacity = 0.5
        clipsToBounds = true
        layer.masksToBounds = false;
    }
    
    func shakeButton()
    {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 8, y: center.y)
        let fromvalue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 8, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromvalue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
        
    }
    
    func pressButtonDown(_ heightConstraint: NSLayoutConstraint, _ widthConstraint: NSLayoutConstraint)
    {
        layer.cornerRadius = Constants.cornerRadiusPowerButtonSmall
        heightConstraint.constant = Constants.heightPowerButtonSmall
        widthConstraint.constant = Constants.widthPowerButtonSmall
        backgroundColor = UIColor.gray
        
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    
    func pressButtonRelease(_ heightConstraint: NSLayoutConstraint, _ widthConstraint: NSLayoutConstraint)
    {
        layer.cornerRadius = Constants.cornerRadiusPowerButtonLarge
        heightConstraint.constant = Constants.heightPowerButtonLarge
        widthConstraint.constant = Constants.widthPowerButtonLarge
        backgroundColor = UIColor.lightGray
    }
    
    
    

}
