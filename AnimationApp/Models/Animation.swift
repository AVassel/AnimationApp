//
//  Animation.swift
//  AnimationApp
//
//  Created by Anton Vassel on 06.06.2022.
//

//import CoreGraphics
import Spring

struct Animation {
    let present: Spring.AnimationPreset
    let curve: Spring.AnimationCurve
    let force: CGFloat
    let duration: CGFloat
    let delay: CGFloat
}
