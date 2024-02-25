import SwiftUI
import AVFAudio

@available(iOS 17.0, *)
struct ContentView: View {
	
	@Environment(StepViewModel.self) private var stepViewModel
	@State var audioPlayer: AVAudioPlayer?
	
	var body: some View {
		NavigationStack{
			HStack{
				ScrollView(.horizontal, showsIndicators: false){
					HStack {
						ForEach(stepViewModel.columns){ block in
							BlockView(block: block)
						}
					}
				}
				Button(action: {
					withAnimation {
						stepViewModel.columns.append(Block(color: .random.opacity(0.5)))
					}
				}) {
					VStack{
						Spacer()
						Image(systemName: "plus")
						Spacer()
					}
					.frame(width: 64)
					.background(.ultraThickMaterial)
					.clipShape(RoundedRectangle(cornerRadius: 8))
				}
			}
			.padding()
			.toolbar {
				StepCounter()
					.padding(.top, 100)
			}
			.navigationTitle("Step")
			.onAppear{
				stepViewModel.startTimer()
			}
		}
	}
}


extension Color {
	static var random: Color {
		let colors = [
			Color.red,
			Color.blue,
			Color.green,
			Color.pink,
			Color.red,
			Color.purple
		]
		return colors.randomElement()!
	}
}
