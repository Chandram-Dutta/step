//
//  Sounds.swift
//  Step
//
//  Created by Chandram Dutta on 25/02/24.
//

import Foundation

class Sound: Identifiable {
	var fileName: String
	var title: String
	var type: String
	var id = UUID()
	
	init(fileName: String, title: String, type: String) {
		self.fileName = fileName
		self.title = title
		self.type = type
	}
}

extension Sound {
	static func sampleSounds() -> [Sound] {
		return [
			Sound(fileName: "drum-boom-bam-blaster", title: "Drum Boom Bam Blaster", type: "Drum"),
			Sound(fileName: "drum-bouncy", title: "Bouncy Drum", type: "Drum"),
			Sound(fileName: "drum-c-loop-no-hats", title: "C Drum Loop(No Hats)", type: "Drum"),
			Sound(fileName: "drum-c-loop", title: "C Drum Loop", type: "Drum"),
			Sound(fileName: "drum-clap-deep-house", title: "Deep House Clap", type: "Drum"),
			Sound(fileName: "drum-dark", title: "Dark Drum", type: "Drum"),
			Sound(fileName: "drum-khufu", title: "Khufu Drum", type: "Drum"),
			Sound(fileName: "drum-kick-long-tail", title: "Kick Long Tail", type: "Drum"),
			Sound(fileName: "drum-noisy-loop", title: "Noisy Drum", type: "Drum"),
			Sound(fileName: "drum-saintkuz-swing", title: "Saintkuz Swing Drum", type: "Drum"),
			Sound(fileName: "drum-witch-haus", title: "Witch Haus Drum", type: "Drum"),
			Sound(fileName: "piano-vinil", title: "Vinil Piano", type: "Piano"),
			Sound(fileName: "synth-chopped", title: "Chopped Synth", type: "Synth"),
			Sound(fileName: "synth-string-plucked", title: "Plucked Synth String", type: "Synth"),
			Sound(fileName: "bass-eat", title: "Eat Bass", type: "Bass"),
			Sound(fileName: "bass-gommiband", title: "Gommiband Bass", type: "Bass"),
			Sound(fileName: "choir-deep-n-dark", title: "Deep N Dark Choir", type: "Choir"),
			Sound(fileName: "choir-epic-female", title: "Epic Female Choir", type: "Choir"),
			Sound(fileName: "piano-lake", title: "Lake Piano", type: "Piano"),
			Sound(fileName: "synth-5th-avenue", title: "5th Avenue Synth", type: "Synth"),
			Sound(fileName: "synth-bedroom", title: "Bedroom Synth", type: "Synth"),
			Sound(fileName: "synth-dream-ye", title: "Ye Dream Synth", type: "Synth"),
			Sound(fileName: "synth-glada-chords", title: "Glada Chords", type: "Synth"),
			Sound(fileName: "synth-ori", title: "Ori Synth", type: "Synth"),
			Sound(fileName: "synth-paradise-prince", title: "Paradise Prince Synth", type: "Synth"),
			Sound(fileName: "synth-phonk", title: "Phonk Synth", type: "Synth"),
			Sound(fileName: "synth-wondagurl-x-travis-scott", title: "Travis Scott x Wondagurl Synth", type: "Synth"),
		]
	}
}
