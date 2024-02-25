//
//  SwiftUIView.swift
//
//
//  Created by Chandram Dutta on 25/02/24.
//

import SwiftUI
import DSWaveformImage
import DSWaveformImageViews

@available(iOS 17.0, *)
struct BlockView: View {
	
	@State private var isOpen = false
	@State private var blockViewModel = BlockViewModel()
	@Environment(StepViewModel.self) private var stepViewModel
	var block: Block
	
	var body: some View {
		ZStack {
			block.color
				.frame(width: 64)
				.clipShape(RoundedRectangle(cornerRadius: 8))
			ScrollView(.vertical, showsIndicators: false){
				VStack {
					Button(action: {
						isOpen.toggle()
					}) {
						Image(systemName: "plus")
							.frame(width: 54, height: 64)
							.background(.ultraThickMaterial)
					}
					.sheet(isPresented: $isOpen){
						SoundSelectionView(block: block)
					}
					.clipShape(RoundedRectangle(cornerRadius: 8))
					ForEach(block.cubes){cube in
						ZStack {
								if blockViewModel.isPlaying && blockViewModel.sound?.title == cube.sound.title{
									Circle()
										.trim(from: 0.0, to: CGFloat(blockViewModel.progress))
										.stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
										.foregroundColor(.white)
										.rotationEffect(.degrees(-90))
										.animation(.linear)
										.frame(width: 48, height: 48)
								}
							WaveformView(audioURL: Bundle.main.url(forResource: cube.sound.fileName, withExtension: "wav")!, renderer: CircularWaveformRenderer()){waveform in
								waveform.stroke(
									Color.white,
									lineWidth: 2
								)
							}
							.frame(width: 54, height: 54)
							.clipShape(RoundedRectangle(cornerRadius: 8))
							if blockViewModel.isPlaying && blockViewModel.sound?.title == cube.sound.title {
								Image(systemName: "pause.circle.fill")
									.resizable()
									.scaledToFit()
									.frame(width: 16, height: 16)
							} else {
								Image(systemName: "play.circle.fill")
									.resizable()
									.scaledToFit()
									.frame(width: 16, height: 16)
							}
						}
						.onTapGesture {
							if blockViewModel.isPlaying && blockViewModel.sound?.title == cube.sound.title {
								blockViewModel.stop()
							} else {
								blockViewModel.playAudio(sound: cube.sound,delay: stepViewModel.soundIndex % 4 == 0 ? 0 : (4 - (stepViewModel.soundIndex % 4)) )
							}
						}
					}
				}
				.padding(.vertical, 4)
			}
		}
	}
}
