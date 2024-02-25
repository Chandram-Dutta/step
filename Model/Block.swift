//
//  Block.swift
//  Step
//
//  Created by Chandram Dutta on 15/02/24.
//

import Foundation
import SwiftUI

@available(iOS 17.0, *)
@Observable
class Block: Identifiable {
	var cubes  = [Cube]()
	var color: Color
	var uuid = UUID()
	
	init(color: Color) {
		self.color = color
	}
}
