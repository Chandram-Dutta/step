//
//  File.swift
//  
//
//  Created by Chandram Dutta on 25/02/24.
//

import Foundation
import AVFAudio
import SwiftUI

@available(iOS 17.0, *)
@Observable
class SoundSelectionViewModel {
	var title: String  = ""
	var file: String = ""
	var audioPlayer: AVAudioPlayer?
	var isPlaying = false
	
	func playAudio(sound: Sound){
		title = sound.title
		file = sound.fileName
		self.audioPlayer?.stop()
		withAnimation {
			isPlaying = true
		}
		if let audioURL = Bundle.main.url(forResource: sound.fileName, withExtension: "wav") {
			do {
				try self.audioPlayer = AVAudioPlayer(contentsOf: audioURL)
				self.audioPlayer?.numberOfLoops = -1
				self.audioPlayer?.play()
			} catch {
				print("Couldn't play audio. Error: \(error)")
			}
		} else {
			print("No audio file found")
		}
	}
	
	func stop() {
		withAnimation {
			isPlaying = false
			title = ""
			file = ""
			self.audioPlayer?.stop()
		}
	}
}
