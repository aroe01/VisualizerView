//
//  VisualizerView.swift
//  TouchVisualizer
//
//  Created by Adrian Roe on 10/29/18.
//  Copyright © 2018 Adrian. All rights reserved.
//

import UIKit
import AVFoundation
//import Accelerate

class VisualizerView : UIView, AVAudioPlayerDelegate{
    @IBOutlet weak var HeightConstraint : NSLayoutConstraint?
    
    func update(_ value : CGFloat){
        self.HeightConstraint?.constant = value
    }
    
//
//    private var player: AVAudioPlayer!
////    fileprivate let centerLineView = UIView()
////    private var dataArray : [Float] = []
////    private var totalCount : Int = 0
////    private var xPoint : CGFloat = 0.0
//    private var gameTimer: Timer!
//    private var sampleRate : CGFloat = 25.0 //samples per second
//    private var frameLength : CGFloat = 0.0
//    private var totalFrameNum : CGFloat = 0.0
////    fileprivate var internalLineWidth : CGFloat = 2.0
////    fileprivate var internalLineSeperation : CGFloat = 1.0
//
//    weak var delegate : VisualizerViewDelegate? {
//        didSet {
//            guard let url = delegate?.urlToPlay() else{return}
//            self.getPath(url: url)
////            self.getDataArray(withPath: url) { (data) in
//
////                print(data)
////            }
////            if (delegate?.urlToPlay() != nil) {
////                guard  let preRenderOption = dataSource?.shouldPreRender?() else {
////                    self.getPath(url: (dataSource?.urlToPlay())!)
////                    preRender = false
////                    return
////                }
////                preRender = preRenderOption
////                self.getPath(url: (dataSource?.urlToPlay())!)
////            }
//        }
//    }
//    private func getPath(url : URL){
//        do {
////            if player != nil,
////                (player.isPlaying) {
////                xPoint = 0
////                for i in dataArray {
////                    if (xPoint < CGFloat(player.currentTime) / CGFloat(player.duration) * self.bounds.width) {
////                        let twoDecimalPlaces = String(format: "%.2f", i)
//////                        self.generatePoints1(dBVal: twoDecimalPlaces)
////                        print(twoDecimalPlaces)
////                    }
////                    else{
////                        break
////                    }
////                }
////
////                let val : CGFloat = CGFloat(player.duration) / (CGFloat(self.frame.size.width - xPoint) * CGFloat(player.rate))
////                self.trackAudio()
////                gameTimer.invalidate()
////                gameTimer = Timer.scheduledTimer(timeInterval: TimeInterval(val * (internalLineWidth + internalLineSeperation)), target: self, selector: #selector(trackAudio), userInfo: nil, repeats: true)
////                return
////            }
//            player = try AVAudioPlayer(contentsOf: url)
//            player.delegate = self
//            player.enableRate = true
//            player.isMeteringEnabled = true
//            player.play()
////            delegate?.didStartPlayingWithSuccess()
//            let duration = CGFloat(player.duration)
//            self.sampleRate = self.sampleRate * CGFloat(player.rate)
//            self.totalFrameNum = duration * self.sampleRate
//            self.frameLength = duration / self.totalFrameNum
////            let val : CGFloat = CGFloat(duration) / (CGFloat(self.frame.size.width) * CGFloat(player.rate))
//            self.trackAudio()
//            gameTimer = Timer.scheduledTimer(timeInterval: TimeInterval(frameLength), target: self, selector: #selector(trackAudio), userInfo: nil, repeats: true)
//        } catch {
//            // couldn't load file :(
//        }
//    }
//    @objc private func trackAudio() {
//
////        NotificationCenter.default.addObserver(self, selector: #selector(rotated(sender:)), name: UIDevice.orientationDidChangeNotification, object: nil)
//        player.updateMeters()
//        for channel in 0..<1{//player.numberOfChannels{
//            let dBLogValue : Float = player.averagePower(forChannel: channel)
//
////        dataArray.append(dBLogValue)
////            let twoDecimalPlaces = String(format: "%.2f", dBLogValue)
////        let twoDecimalPlaces = String(format: "%.2f", dataArray[totalCount])
////        totalCount += 1
////        self.generatePoints1(dBVal: twoDecimalPlaces)
//            let invertedDBValue : CGFloat = -1 * CGFloat(-160 - dBLogValue)
//            let twoDecimalPlaces = String(format: "%.2f", invertedDBValue)
//            print("Channel \(channel): \(twoDecimalPlaces)")
//            self.HeightConstraint?.constant = invertedDBValue * 2
//        }
//    }
    
//    private func getDataArray(withPath audioFileURL : URL, completionHandler: @escaping(_ success: [Float]) -> () ) {
//        let audioFile = try! AVAudioFile(forReading: audioFileURL)
//        let audioFilePFormat = audioFile.processingFormat
//        let audioFileLength = audioFile.length
//        // get numberOfReadLoops value
//        let numberOfReadLoops = Int(self.frame.width / (internalLineWidth + internalLineSeperation))
//        let frameSizeToRead = Int(audioFileLength) / numberOfReadLoops
//        DispatchQueue.global(qos: .userInitiated).async {
//            var returnArray : [Float] = []
//            for i in 0..<numberOfReadLoops {
//                audioFile.framePosition = AVAudioFramePosition(i * frameSizeToRead)
//                guard let audioBuffer = AVAudioPCMBuffer(pcmFormat: audioFilePFormat, frameCapacity: AVAudioFrameCount(frameSizeToRead)) else{ continue}
//                try! audioFile.read(into: audioBuffer, frameCount: AVAudioFrameCount(frameSizeToRead))
//                let channelData = audioBuffer.floatChannelData![0]
//                let arr = Array(UnsafeBufferPointer(start:channelData, count: frameSizeToRead))
//                let positiveArray = arr.map({ $0 })
//                let sum = positiveArray.reduce(0, +)
//                returnArray.append( sum / (Float(positiveArray.count)))
//                completionHandler(returnArray)
//                returnArray.removeAll()
//            }
//        }
//    }
    
    
}
