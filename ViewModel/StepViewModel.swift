//
//  File.swift
//  
//
//  Created by Chandram Dutta on 25/02/24.
//

import Foundation
import SwiftUI

@available(iOS 17.0, *)
@Observable
class StepViewModel {
	var columns = [Block]()
	
	var timer: Timer?
	var soundIndex = 1
	
	func startTimer() {
		timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
			withAnimation{
				self.soundIndex += 1
				if self.soundIndex == 9 {
					self.soundIndex = 1
				}
			}
		}
	}
}
