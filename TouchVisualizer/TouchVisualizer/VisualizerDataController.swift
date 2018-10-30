//
//  VisualizerDataController.swift
//  TouchVisualizer
//
//  Created by Adrian Roe on 10/29/18.
//  Copyright © 2018 Adrian. All rights reserved.
//

import UIKit
import AVFoundation
//import Accelerate

protocol VisualizerViewDatasource : class{
    func urlToPlay() -> URL
}

protocol VisualizerViewDelegate : class{
    func displayChannelData(data : [CGFloat])
}

class VisualizerDataController : NSObject, AVAudioPlayerDelegate{
    
    private var player: AVAudioPlayer!
    private var gameTimer: Timer!
    private var sampleRate : CGFloat = 25.0 //samples per second
    private var frameLength : CGFloat = 0.0
    private var totalFrameNum : CGFloat = 0.0

    
    weak var delegate : VisualizerViewDelegate?
    weak var datasource : VisualizerViewDatasource?{
        didSet {
            guard let url = datasource?.urlToPlay() else{return}
            self.loadUrl(url: url)
        }
    }
    private func loadUrl(url : URL){
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.delegate = self
            player.enableRate = true
            player.isMeteringEnabled = true
            player.play()
            
            let duration = CGFloat(player.duration)
            self.sampleRate = self.sampleRate * CGFloat(player.rate)
            self.totalFrameNum = duration * self.sampleRate
            self.frameLength = duration / self.totalFrameNum
            
            self.trackAudio()
            gameTimer = Timer.scheduledTimer(timeInterval: TimeInterval(frameLength), target: self, selector: #selector(trackAudio), userInfo: nil, repeats: true)
        } catch {
            
        }
    }
    @objc private func trackAudio() {
        
        let scalarValue : CGFloat = 1
        
        //        NotificationCenter.default.addObserver(self, selector: #selector(rotated(sender:)), name: UIDevice.orientationDidChangeNotification, object: nil)
        player.updateMeters()
        var channelData : [CGFloat] = []
        for channel in 0..<player.numberOfChannels{
            
            let dBLogValue : Float = player.averagePower(forChannel: channel)
            
            //        dataArray.append(dBLogValue)
            //            let twoDecimalPlaces = String(format: "%.2f", dBLogValue)
            //        let twoDecimalPlaces = String(format: "%.2f", dataArray[totalCount])
            //        totalCount += 1
            //        self.generatePoints1(dBVal: twoDecimalPlaces)
            let invertedDBValue : CGFloat = -1 * CGFloat(-160 - dBLogValue)
            let twoDecimalPlaces = String(format: "%.2f", invertedDBValue)
            print("Channel \(channel): \(twoDecimalPlaces)")
//            self.HeightConstraint?.constant = invertedDBValue * 2
            channelData.append(invertedDBValue * scalarValue)
            
            let peakValue : Float = player.peakPower(forChannel: channel)
            let peakInvertedDBValue : CGFloat = -1 * CGFloat(-160 - peakValue)
            let peakTwoDecimalPlaces = String(format: "%.2f", peakInvertedDBValue)
            print("Channel \(channel): \(peakTwoDecimalPlaces)")
            channelData.append(peakInvertedDBValue * scalarValue)
        }
        
        self.delegate?.displayChannelData(data: channelData)
    }
    
    
}
