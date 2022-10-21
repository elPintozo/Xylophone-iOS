import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        let letter : String? = sender.titleLabel?.text as Optional<String>
        
        sender.alpha = 0.5

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
            sender.alpha = 1.0
        }
        
        playSound(buttonPressed: letter!)
    }
    
    func playSound(buttonPressed : String) {
        print("Presset: \(buttonPressed)")
        guard let url = Bundle.main.url(forResource: buttonPressed, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    

}

