//
//  PowerBtn.swift
//  LaserBox
//
//  Created by Zachary Johnson on 5/28/20.
//  Copyright © 2020 Zachary Johnson. All rights reserved.
//

import SwiftUI


struct PowerButtonStyle: ButtonStyle {
    let size : CGFloat = 124
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(
                minWidth: Constants.widthPowerButtonSmall,
                idealWidth: Constants.widthPowerButtonLarge,
                maxWidth: Constants.widthPowerButtonLarge,
                minHeight: Constants.heightPowerButtonSmall,
                idealHeight: Constants.heightPowerButtonLarge,
                maxHeight: Constants.heightPowerButtonLarge,
                alignment: Alignment.center)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .shadow(color: Color.gray.opacity(0.7), radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? 5: 15, y: configuration.isPressed ? 5: 15)
    }
}

//struct PowerButton<T:View> : View {
//    let content: T
//
//    init(content: () -> T)
//    {
//        self.content = content()
//    }
//
//    var body: some View
//    {
//        VStack
//        {
//            Button(action: {self.ButtonPressed()})
//            {
//                content
//                    .padding()
//                    .frame(minWidth: Constants.widthPowerButtonSmall, idealWidth: Constants.widthPowerButtonLarge, maxWidth: Constants.widthPowerButtonLarge, minHeight: Constants.heightPowerButtonSmall, idealHeight: Constants.heightPowerButtonLarge, maxHeight: Constants.heightPowerButtonLarge, alignment: Alignment.center)
//                    .scaleEffect(content.isPessed)
//            }.buttonStyle(PlainButtonStyle()).shadow(color: Color.red, radius: 10, x: 0, y: 0)
//        }
//
//    }
//
//
//
//}

//public struct PowerBtn : Button<<#SelectionValue: Hashable#>, <#Content: View#>>
//{
//
//
//}
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupButton()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setupButton()
//    }
//
//    func setupButton()
//    {
//        setShadow()
//        setTitleColor(.white, for: .normal)
//        setTitle("Button", for: .normal)
//
//        backgroundColor = UIColor.lightGray
//        titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
//        layer.cornerRadius = 62
//    }
//
//    private func setShadow()
//    {
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = CGSize(width:0.0 , height:6.0)
//        layer.shadowRadius = 8.0
//        layer.shadowOpacity = 0.5
//        clipsToBounds = true
//        layer.masksToBounds = false;
//    }
//
//    func shakeButton()
//    {
//        let shake = CABasicAnimation(keyPath: "position")
//        shake.duration = 0.1
//        shake.repeatCount = 2
//        shake.autoreverses = true
//
//        let fromPoint = CGPoint(x: center.x - 8, y: center.y)
//        let fromvalue = NSValue(cgPoint: fromPoint)
//
//        let toPoint = CGPoint(x: center.x + 8, y: center.y)
//        let toValue = NSValue(cgPoint: toPoint)
//
//        shake.fromValue = fromvalue
//        shake.toValue = toValue
//
//        layer.add(shake, forKey: "position")
//
//    }
//
//    func pressButtonDown(_ heightConstraint: NSLayoutConstraint, _ widthConstraint: NSLayoutConstraint)
//    {
//        layer.cornerRadius = Constants.cornerRadiusPowerButtonSmall
//        heightConstraint.constant = Constants.heightPowerButtonSmall
//        widthConstraint.constant = Constants.widthPowerButtonSmall
//        backgroundColor = UIColor.gray
//
//        let generator = UIImpactFeedbackGenerator(style: .medium)
//        generator.impactOccurred()
//    }
//
//    func pressButtonRelease(_ heightConstraint: NSLayoutConstraint, _ widthConstraint: NSLayoutConstraint)
//    {
//        layer.cornerRadius = Constants.cornerRadiusPowerButtonLarge
//        heightConstraint.constant = Constants.heightPowerButtonLarge
//        widthConstraint.constant = Constants.widthPowerButtonLarge
//        backgroundColor = UIColor.lightGray
//    }

struct PowerButton_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
