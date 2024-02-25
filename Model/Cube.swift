//
//  Cube.swift
//  Step
//
//  Created by Chandram Dutta on 25/02/24.
//

import Foundation

class Cube: Identifiable {
	var sound: Sound
	var id = UUID()
	
	init(sound: Sound) {
		self.sound = sound
	}
}
