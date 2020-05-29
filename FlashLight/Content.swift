//
//  Content.swift
//  FlashLight
//
//  Created by Zachary Johnson on 5/28/20.
//  Copyright © 2020 Zachary Johnson. All rights reserved.
//

import SwiftUI
import AVFoundation

struct FlashLightState
{
    var isOn: Bool = false
    var powerLevel: Float = 1.0
}



struct Content: View {
    @State var flashLightState = FlashLightState()
    let powerImage = UIImage(named: "PowerButtonImage512")
    
    var body: some View {
        HStack {
            VStack {
                CreatePowerButton()
                CreatePowerLevelSlider()
            }
        }
    }
    
    func CreatePowerButton() -> some View
    {
        return Button(action: {self.PressPowerButton(lightInfo: &self.flashLightState)})
            {
            Image(uiImage: powerImage!)
            }
            .buttonStyle(PlainButtonStyle())
            .cornerRadius(100)
    }
    
    func CreatePowerLevelSlider() -> some View
    {
        return Slider(value: Binding(get: {
            self.flashLightState.powerLevel
        }, set: { (newVal) in
            self.flashLightState.powerLevel = newVal
            self.sliderChanged(lightInfo: &self.flashLightState)
        }), in: 0.1...1.0, step: 0.01)
        .padding(EdgeInsets(
                        top: CGFloat(0),
                        leading: CGFloat(50),
                        bottom: CGFloat(0),
                        trailing: CGFloat(50)))
    }
    
    func PressPowerButton(lightInfo: inout FlashLightState)
    {
        toggleTorch(lightInfo: &lightInfo)
    }

    func toggleTorch(lightInfo: inout FlashLightState)
    {
        guard
            let device = AVCaptureDevice.default(for: AVMediaType.video),
            device.hasTorch
        else { return }

        do {
            try device.lockForConfiguration()
            device.torchMode = lightInfo.isOn ? .on : .off
            if lightInfo.isOn {
                device.torchMode = .off
            }else{
                device.torchMode = .on
                adjustTorchBrightness(lightInfo: &flashLightState)
            }
            
            lightInfo.isOn = !lightInfo.isOn
            device.unlockForConfiguration()

        } catch {
            print("Torch could not be used")
        }
    }

    func adjustTorchBrightness(lightInfo: inout FlashLightState)
    {
        if(lightInfo.powerLevel == 0)
        {
            return
        }

        guard
            let device = AVCaptureDevice.default(for: AVMediaType.video),
            device.hasTorch
        else { return }

        do {
            try device.lockForConfiguration()
            try device.setTorchModeOn(level: lightInfo.powerLevel)
            device.unlockForConfiguration()

        } catch {
            print("Torch could not be adjusted")
        }
    }

    func sliderChanged(lightInfo: inout FlashLightState)
    {
        adjustTorchBrightness(lightInfo: &flashLightState)
    }

}

struct Content_Previews: PreviewProvider {
    static var previews: some View {
        Content()
    }
}

