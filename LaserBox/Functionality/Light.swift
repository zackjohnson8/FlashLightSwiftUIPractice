//
//  Light.swift
//  LaserBox
//
//  Created by Zachary Johnson on 6/7/20.
//  Copyright © 2020 Zachary Johnson. All rights reserved.
//

import SwiftUI
import AVFoundation

public struct Light {
  static private var isOn: Bool = false
  static private var powerLevel: Float = 1.0
  static private var powerLevel_m = 1.0
  
  static func turnOn()
  {
    toggleTorch()
  }
  
  static func turnOff()
  {
    toggleTorch()
  }
  
  static func powerLevel(_ level: Float)
  {
      if level >= 0.0 || level <= 1.01
      {
        powerLevel = level
        adjustTorchBrightness()
      }else
      {
        print("powerLevel _level must be between .01 and 1.0 your value is = " + String(level))
      }
  }
  
  static private func toggleTorch()
  {
    guard
        let device = AVCaptureDevice.default(for: AVMediaType.video),
        device.hasTorch
    else { return }

    do {
        try device.lockForConfiguration()
        device.torchMode = isOn ? .on : .off
        if isOn {
            device.torchMode = .off
        }else{
            device.torchMode = .on
            adjustTorchBrightness()
        }

        isOn = !isOn
        device.unlockForConfiguration()

    } catch {
        print("Torch could not be used")
    }
  }
  
  static private func adjustTorchBrightness()
  {
    
      print("Here")
      guard
          let device = AVCaptureDevice.default(for: AVMediaType.video),
          device.hasTorch
      else { return }

      if(powerLevel == 0  || device.torchMode == .off)
      {
          return
      }

      do {
          try device.lockForConfiguration()
          try device.setTorchModeOn(level: powerLevel)
          device.unlockForConfiguration()

      } catch {
          print("Torch could not be adjusted")
      }
  }
    
}
