//
//  ViewController.swift
//  Instagram dp animation
//
//  Created by Vineet Rai on 08/05/21.
//

import UIKit
import SuitabilityPredictionClient
class ViewController: UIViewController {
    let suitabilityClient: SuitabilityClient = .configure(withKey: "2671796e93c447df8a71e478940d437c")!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        let story = StoryDPView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        story.setupForStory(image: UIImage(named: "1")!)
        self.view .addSubview(story)
        story.center = self.view.center
        if #available(iOS 13.0.0, *) {
            self.imagePre()
        } else {
            // Fallback on earlier versions
        }
    }
    
    @available(iOS 13.0.0, *)
    func imagePre(){
        Task {
            do {
                let output = try? await suitabilityClient.predict(
                    input: UIImage(named: "1")!)
                print(output ?? "")
            } catch {
                // HANDLE ERROR
                print(error)
            }
        }
    }


}

