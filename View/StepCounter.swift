//
//  SwiftUIView.swift
//
//
//  Created by Chandram Dutta on 26/02/24.
//

import SwiftUI

@available(macCatalyst 17.0, *)
struct StepCounter: View {
	@Environment(StepViewModel.self) private var stepViewModel
	
	var body: some View {
		HStack {
			ForEach(1..<9){ b in
				RoundedRectangle(cornerRadius: 10)
					.fill(b == stepViewModel.soundIndex ? Color.blue: .gray)
					.frame(width: 50, height: 50)
			}
		}
	}
}
