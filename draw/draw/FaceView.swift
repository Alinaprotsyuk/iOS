//
//  FaceView.swift
//  draw
//
//  Created by ITA student on 9/8/17.
//  Copyright © 2017 Alina Protsyuk. All rights reserved.
//

import UIKit

class FaceView: UIView {
    
    let scale : CGFloat = 0.9
    
    private var skullRadius : CGFloat {
        return min(bounds.size.width, bounds.size.height) / 2 * scale
    }
    private var skullCenter : CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    private enum Eye {
        case left
        case rigth
    }
    
    private func pathForEye(_ eye: Eye) -> UIBezierPath{
        func centerOfEye (_ eye: Eye) -> CGPoint{
            let eyeOffset = skullRadius / ratios.skullRadiusToEyeOffset
            var eyeCenter = skullCenter
            
            eyeCenter.y -= eyeOffset
            eyeCenter.x += ((eye == .left) ? -1 : 1) * eyeOffset
            
            return eyeCenter
        }
        
    }
    
    private func pathForSkull() -> UIBezierPath {
        let path = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
        
        path.lineWidth = 5.0
        return path
        
    }

    override func draw(_ rect: CGRect) {
        
        
        UIColor.blue.set()
        
        pathForSkull().stroke()
        
    }
   
    private struct ratios {
        static let skullRadiusToEyeOffset: CGFloat = 3
        static let skullRadiusToEyeRadius: CGFloat = 10
        static let skullRadiusToMouthWidth: CGFloat = 1
        static let skullRadiusToMouthHeigh: CGFloat = 3
        static let skullRadiusToMouthOffset: CGFloat = 3
    }

}
