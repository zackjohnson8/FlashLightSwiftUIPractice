//
//  PowerBtn.swift
//  LaserBox
//
//  Created by Zachary Johnson on 5/28/20.
//  Copyright © 2020 Zachary Johnson. All rights reserved.
//

import SwiftUI


struct PowerButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .shadow(color: Color.gray.opacity(0.7), radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? 5: 15, y: configuration.isPressed ? 5: 15)
    }
}
