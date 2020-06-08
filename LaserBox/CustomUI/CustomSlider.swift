//
//  SliderCustom.swift
//  LaserBox
//
//  Created by Zachary Johnson on 6/3/20.
//  Copyright © 2020 Zachary Johnson. All rights reserved.
//

import Sliders
import SwiftUI

struct CustomSlider: View {
    @State var value = 0.5
    @State var range = 0.2...0.8
    
    var body: some View {
        Group {
            ValueSlider(value: $value)
        }
    }
}


