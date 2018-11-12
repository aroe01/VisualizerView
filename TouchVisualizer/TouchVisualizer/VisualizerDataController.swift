//
//  VisualizerDataController.swift
//  TouchVisualizer
//
//  Created by Adrian Roe on 10/29/18.
//  Copyright © 2018 Adrian. All rights reserved.
//

import Foundation
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
    private var sampleRate : CGFloat = 6.0 //samples per second
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
//    var low : Float = 2000
//    var high : Float = 0
    let scalarValue : CGFloat = 400
    
    @objc private func trackAudio() {
        
        
        
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
            let invertedDBValue = self.normalizePowerData(dBLogValue)
//            let twoDecimalPlaces = String(format: "%.2f", invertedDBValue)
//            print("Channel \(channel): \(twoDecimalPlaces)")
//            self.HeightConstraint?.constant = invertedDBValue * 2
            channelData.append(invertedDBValue )
            
            let peakValue : Float = player.peakPower(forChannel: channel)
            let peakInvertedDBValue : CGFloat = self.normalizePowerData(peakValue)
//            let peakTwoDecimalPlaces = String(format: "%.2f", peakInvertedDBValue)
//            print("Channel \(channel): \(peakTwoDecimalPlaces)")
            channelData.append(peakInvertedDBValue )
        }
        self.delegate?.displayChannelData(data: channelData)
    }
    
    let numMin : CGFloat = 140
    let numMax : CGFloat = 160
    
    fileprivate func normalizePowerData(_ dBLogValue : Float) -> CGFloat{
//        low = min(low, dBLogValue)
//        high = max(high, dBLogValue)
//        let invertedDBValue : CGFloat = -1 * CGFloat(-160 - dBLogValue)
        let invertedDBValue : CGFloat = CGFloat(dBLogValue + 160)
        let adjusted = (invertedDBValue - numMin) / (numMax - numMin)
        
        let normalized = max(min(adjusted, 1), 0)
        print("V: \(invertedDBValue) A: \(adjusted) N: \(normalized)")
        
        return normalized * scalarValue
    }
    
}
