//
//  Content.swift
//  LaserBox
//
//  Created by Zachary Johnson on 5/28/20.
//  Copyright © 2020 Zachary Johnson. All rights reserved.
//

import SwiftUI
import AVFoundation

struct LaserBoxState
{
    var isOn: Bool = false
    var powerLevel: Float = 1.0
}



struct Content: View {
    @State var laserBoxState = LaserBoxState()
    let powerButtonImage = UIImage(named: "PowerButtonImage512")
    
    
    var body: some View {
        VStack {
            Button(action: {}) {
                Image(uiImage: powerButtonImage!)
                .overlay(
                    Circle()
                    .stroke(Color.black, lineWidth: 4))
            }.buttonStyle(PowerButtonStyle())
        }
        
    }
}


struct Content_Previews: PreviewProvider {
    static var previews: some View {
        Content()
    }
}
    
//    func CreatePowerButton() -> some View
//    {
//        return Button(action: {self.PressPowerButton(lightInfo: &self.laserBoxState)})
//        {
//            Image(uiImage: powerImage!)
//                .clipShape(Circle())
//        }
//        .buttonStyle(PlainButtonStyle())
//        .clipShape(Circle())
//        //.cornerRadius(100)
//        //.border(Circle, width: 20)
//    }
    
//    func CreatePowerLevelSlider() -> some View
//    {
//        return Slider(value: Binding(get: {
//            self.laserBoxState.powerLevel
//        }, set: { (newVal) in
//            self.laserBoxState.powerLevel = newVal
//            self.sliderChanged(lightInfo: &self.laserBoxState)
//        }), in: 0.1...1.0, step: 0.01)
//        .padding(EdgeInsets(
//                        top: CGFloat(0),
//                        leading: CGFloat(50),
//                        bottom: CGFloat(0),
//                        trailing: CGFloat(50)))
//    }
//
//    func PressPowerButton(lightInfo: inout LaserBoxState)
//    {
//        toggleTorch(lightInfo: &lightInfo)
//    }
//
//    func toggleTorch(lightInfo: inout LaserBoxState)
//    {
//        guard
//            let device = AVCaptureDevice.default(for: AVMediaType.video),
//            device.hasTorch
//        else { return }
//
//        do {
//            try device.lockForConfiguration()
//            device.torchMode = lightInfo.isOn ? .on : .off
//            if lightInfo.isOn {
//                device.torchMode = .off
//            }else{
//                device.torchMode = .on
//                adjustTorchBrightness(lightInfo: &laserBoxState)
//            }
//
//            lightInfo.isOn = !lightInfo.isOn
//            device.unlockForConfiguration()
//
//        } catch {
//            print("Torch could not be used")
//        }
//    }
//
//    func adjustTorchBrightness(lightInfo: inout LaserBoxState)
//    {
//        guard
//            let device = AVCaptureDevice.default(for: AVMediaType.video),
//            device.hasTorch
//        else { return }
//
//        if(lightInfo.powerLevel == 0  || device.torchMode == .off)
//        {
//            return
//        }
//
//        do {
//            try device.lockForConfiguration()
//            try device.setTorchModeOn(level: lightInfo.powerLevel)
//            device.unlockForConfiguration()
//
//        } catch {
//            print("Torch could not be adjusted")
//        }
//    }
//
//    func sliderChanged(lightInfo: inout LaserBoxState)
//    {
//        adjustTorchBrightness(lightInfo: &laserBoxState)
//    }
//
//}
