//
//  SliderBar.swift
//  FlashLight
//
//  Created by Zachary Johnson on 5/21/20.
//  Copyright © 2020 Zachary Johnson. All rights reserved.
//

import UIKit

public class SliderBar : UISlider
{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupSlider()
    {
        self.backgroundColor = UIColor.green
    }

}
