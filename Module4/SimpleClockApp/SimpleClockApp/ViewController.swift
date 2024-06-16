//
//  ViewController.swift
//  SimpleClockApp
//
//  Created by James Clifford on 6/15/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var timer: Timer?
    var totalSeconds: TimeInterval = 0
    var player: AVAudioPlayer?
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss"
        return formatter
    }()
    
    @IBOutlet weak var remainingTimeLabel: UILabel!
    @IBOutlet weak var timerValue: UIDatePicker!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        startClockTimer()
    }
    
    func setupUI() {
        buttonOne.setTitle("Start Timer", for: .normal)
        remainingTimeLabel.text = ""
    }
    
    func startClockTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.updateClock()
        }
    }
    
    func updateClock() {
        let currentDate = Date()
        currentTime.text = dateFormatter.string(from: currentDate)
        
        let currentHour = Calendar.current.component(.hour, from: currentDate)
        if currentHour >= 6 && currentHour < 21 {
            view.backgroundColor = .systemGreen
        } else {
            view.backgroundColor = .systemBlue
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if buttonOne.currentTitle == "Stop Music" {
            stopSound()
            buttonOne.setTitle("Start Timer", for: .normal)
        } else {
            startTimer()
        }
    }
    
    func startTimer() {
        totalSeconds = timerValue.countDownDuration
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.updateTimer()
        }
    }
    
    func updateTimer() {
        if totalSeconds > 0 {
            totalSeconds -= 1
            remainingTimeLabel.text = formattedTime(totalSeconds)
        } else {
            timer?.invalidate()
            remainingTimeLabel.text = "Time Remaining: 00:00:00"
            buttonOne.setTitle("Stop Music", for: .normal)
            playSound()
        }
    }
    
    func formattedTime(_ timeInterval: TimeInterval) -> String {
        let hours = Int(timeInterval / 3600)
        let minutes = Int((timeInterval.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(timeInterval.truncatingRemainder(dividingBy: 60))
        
        return String(format: "Time Remaining: %02d:%02d:%02d", hours, minutes, seconds)
    }
    
    func playSound() {
        guard let soundURL = Bundle.main.url(forResource: "LoFi_2", withExtension: "mp3") else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: soundURL)
            player?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
    func stopSound() {
        player?.stop()
    }
}


