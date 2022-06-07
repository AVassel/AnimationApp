//
//  ViewController.swift
//  AnimationApp
//
//  Created by Anton Vassel on 06.06.2022.
//

import Spring

class ViewController: UIViewController {
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var springView: SpringView!
    
    private var animation: Animation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshAnimation()
        settingsLabel.text = getString(from: animation)
    }
    
    @IBAction func runButtonPressed(_ sender: UIButton) {
        animate(with: animation)
        settingsLabel.text = getString(from: animation)
        refreshAnimation()
        sender.setTitle("Run \(animation.present)", for: .normal)
    }
    
    private func animate(with animationSettings: Animation) {
        springView.animation = animationSettings.present.rawValue
        springView.curve = animationSettings.curve.rawValue
        springView.force = animationSettings.force
        springView.duration = animationSettings.duration
        springView.delay = animationSettings.delay
        springView.animate()
    }
    
    private func getAnimationSettings() -> Animation {
        return Animation(
            present: Spring.AnimationPreset.allCases.randomElement() ?? .fadeIn,
            curve: Spring.AnimationCurve.allCases.randomElement() ?? .easeIn,
            force: CGFloat.random(in: 1...2),
            duration: CGFloat.random(in: 1.5...2),
            delay: CGFloat.random(in: 0.5...1))
    }
    
    private func refreshAnimation() {
        animation = getAnimationSettings()
    }
    
    private func getString(from animation: Animation) -> String {
        String("""
present: \(animation.present.rawValue)
curve: \(animation.curve.rawValue)
force: \(formattingString(from: animation.force))
duration: \(formattingString(from: animation.duration))
delay: \(formattingString(from: animation.delay))
""")
    }
    
    private func formattingString(from value: CGFloat) -> String {
        String(format: "%.2f", value)
    }
}

