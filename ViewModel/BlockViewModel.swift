//
//  File.swift
//  
//
//  Created by Chandram Dutta on 25/02/24.
//

import Foundation
import AVFAudio

@available(iOS 17.0, *)
@Observable
class BlockViewModel {
	var sound: Sound?
	var audioPlayer: AVAudioPlayer?
	var isPlaying = false
	var progress: Double = 0
	private var timer: Timer?
	
	func playAudio(sound: Sound, delay: Int){
		self.sound = sound
		isPlaying = true
		if let audioURL = Bundle.main.url(forResource: sound.fileName, withExtension: "wav") {
			do {
				DispatchQueue.main.asyncAfter(deadline: .now() + Double(delay)) {
					self.audioPlayer?.stop()
					self.timer?.invalidate()
					do { self.audioPlayer = try AVAudioPlayer(contentsOf: audioURL) }catch{
						print("error")
					}
					self.audioPlayer?.numberOfLoops = -1
					self.audioPlayer?.play()
					self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] timer in
						guard let self = self, let audioPlayer = self.audioPlayer else {
							timer.invalidate()
							return
						}
						self.progress = audioPlayer.currentTime / audioPlayer.duration
					}
				}
			}
		} else {
			print("No audio file found")
		}
	}
	
	func stop() {
		isPlaying = false
		self.sound = nil
		self.audioPlayer?.stop()
		timer?.invalidate()
	}
}
