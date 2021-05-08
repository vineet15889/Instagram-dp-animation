//
//  ViewController.swift
//  Instagram dp animation
//
//  Created by Vineet Rai on 08/05/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        let story = StoryDPView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        story.setupForStory(image: UIImage(named: "1")!)
        self.view .addSubview(story)
        story.center = self.view.center
    }


}

