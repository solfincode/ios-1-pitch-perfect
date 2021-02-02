//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Q on 2021/02/01.
//

import UIKit
import AVFoundation
class RecordSoundsViewController: UIViewController,AVAudioRecorderDelegate{
    var audioRecorder:AVAudioRecorder!
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
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))

        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    
    @IBAction func stopRecording(_ sender: Any) {
        stopRecordingButton.isEnabled=false
        startRecordingButton.isEnabled=true
        recordingLabel.text="Tap to Record"
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag{
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        }else{
            print("not successful recording")
        }
    }
    
    override func prepare(for segue:UIStoryboardSegue,sender:Any?){
        if segue.identifier == "stopRecording"{
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }

}

