//
//  MusicPlayerModalViewController.swift
//  Modal
//
//  Created by COTEMIG on 10/06/25.
//

import UIKit

class MusicPlayerModalViewController: UIViewController {
    
    
    @IBOutlet weak var musicSlider: UISlider!
    @IBOutlet weak var playPauseButton: UIButton!
    
    var sliderAnimationTimer: Timer?
    let maxSliderValue: Float = 100.0
    override func viewDidLoad() {
        super.viewDidLoad()
        musicSlider.minimumValue = 0.0
        musicSlider.maximumValue = maxSliderValue
        musicSlider.value = 0.0
        playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
    }
    deinit {
        stopSliderAnimation()
    }
    @IBAction func playPauseButtonTapped(_ sender: UIButton) {
        if sliderAnimationTimer != nil {
            stopSliderAnimation()
            musicSlider.value = 0.0
            playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            startSliderAnimation()
            playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }
    private func startSliderAnimation() {
        stopSliderAnimation()
        sliderAnimationTimer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { [weak self] timer in
            guard let self = self else {
                timer.invalidate()
                return
            }
            self.musicSlider.value += 1.0
            if self.musicSlider.value >= self.maxSliderValue {
                self.musicSlider.value = self.musicSlider.minimumValue
            }
        }
        RunLoop.current.add(sliderAnimationTimer!, forMode: .common)
    }
    private func stopSliderAnimation() {
        sliderAnimationTimer?.invalidate()
        sliderAnimationTimer = nil
    }
}
