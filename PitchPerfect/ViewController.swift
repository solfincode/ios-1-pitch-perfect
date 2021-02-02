//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Q on 2021/02/01.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    @IBOutlet weak var startRecordingButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.isEnabled=false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startRecording(_ sender: Any) {
       
        recordingLabel.text="Recording in progress"
        stopRecordingButton.isEnabled=true
        startRecordingButton.isEnabled=false
    }
    
    
    @IBAction func stopRecording(_ sender: Any) {
        stopRecordingButton.isEnabled=false
        startRecordingButton.isEnabled=true
    }
    

}

