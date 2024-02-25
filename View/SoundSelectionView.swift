//
//  SoundSelectionView.swift
//  Step
//
//  Created by Chandram Dutta on 25/02/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct SoundSelectionView: View {
	@Environment(\.dismiss) private var dismiss
	@Environment(StepViewModel.self) private var stepViewModel
	@State private var soundSelectionViewModel = SoundSelectionViewModel()
	
	var block: Block
	
	var body: some View {
		NavigationStack{
			List(Sound.sampleSounds()) { sound in
				HStack{
					Image(systemName: "plus").onTapGesture {
						stepViewModel.columns.first(where: {$0.id == block.id})?.cubes.append(Cube(sound: sound))
					}
					.foregroundColor(.accentColor)
					.frame(width: 18)
					Text(sound.title)
					Spacer()
					if soundSelectionViewModel.isPlaying && soundSelectionViewModel.title == sound.title {
						Image(systemName: "pause").onTapGesture {
							soundSelectionViewModel.stop()
						}
						.foregroundColor(.accentColor)
					} else {
						Image(systemName: "play").onTapGesture {
							soundSelectionViewModel.playAudio(sound: sound)
						}
						.foregroundColor(.accentColor)
						.frame(width: 18)
					}
				}
			}
			.toolbar{
				Button("Cancel") {
					dismiss()
				}
			}
			.navigationTitle("Choose Sounds")
		}
	}
}
