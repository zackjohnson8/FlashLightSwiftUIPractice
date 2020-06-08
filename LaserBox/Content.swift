//
//  Content.swift
//  LaserBox
//
//  Created by Zachary Johnson on 5/28/20.
//  Copyright © 2020 Zachary Johnson. All rights reserved.
//

import SwiftUI
import Sliders

struct Content: View {
  @State var value : Float = 1.0
  @State var range = 0.2...0.8
  @State var lightIsOn = false
  let powerButtonImage = UIImage(named: "PowerButtonImage512")
  
  var body: some View {

    VStack{
      VStack {
        Button(action: {self.isPressed()}) {
            Image(uiImage: powerButtonImage!)
            .overlay(
                Circle()
                .stroke(Color.black, lineWidth: 4))
          }.buttonStyle(PowerButtonStyle())
      }
      
      Spacer().frame(width: 10, height: 20, alignment: .bottom)
      
      VStack {
        ValueSlider(value: $value, in: 0.01...0.9, step: 0.01, onEditingChanged: {_ in self.isChanged()})
          .frame(maxWidth: .infinity, maxHeight: 20, alignment: .center)
          .padding(.horizontal, 50).padding(.vertical, 15)
      }
    }
  }
  
  func isPressed()
  {
    if lightIsOn{
      Light.turnOff()
    } else
    {
      Light.turnOn()
    }
    
    lightIsOn = !lightIsOn
  }

  func isChanged()
  {
    Light.powerLevel(self.value)
    print("Changed")
  }
    
}


struct Content_Previews: PreviewProvider {
    static var previews: some View {
        Content()
    }
}
