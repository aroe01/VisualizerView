//  MIT License
//
//Copyright (c) 2017 Md Ibrahim Hassan
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

import UIKit
class ViewController: UIViewController {
    
//    @IBOutlet var musicView: IHWaveFormView!
    fileprivate var dataController : VisualizerDataController = VisualizerDataController()
    @IBOutlet weak var visualizerView0 : VisualizerView?
    @IBOutlet weak var visualizerView1 : VisualizerView?
    @IBOutlet weak var visualizerView0Peak : VisualizerView?
    @IBOutlet weak var visualizerView1Peak : VisualizerView?
    
    @IBOutlet weak var circleVisualizer : CircleVisualizerView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.musicView.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.8509803922, alpha: 1)
//        self.musicView.delegate = self
//        self.musicView.dataSource = self
//        self.visualizerView?.delegate = self
        
        
        self.dataController.delegate = self
        self.dataController.datasource = self
    }
    
}
extension ViewController : VisualizerViewDelegate{
    func displayChannelData(data: [CGFloat]) {
        self.visualizerView0?.update(data[0])
        self.visualizerView0Peak?.update(data[1])
        self.visualizerView1?.update(data[2])
        self.visualizerView1Peak?.update(data[3])
        
        self.circleVisualizer?.update(data[0])
    }
    
}
extension ViewController : VisualizerViewDatasource{
    func urlToPlay() -> URL {
        var url : URL?
        let path = Bundle.main.path(forResource: "bensound-sunny.mp3", ofType:nil)!
        url = URL(fileURLWithPath: path)
        return url!
    }
}

//extension ViewController: IHWaveFormViewDelegate {
//    func didFinishPlayBack() {
//        print ("playBack Finished")
//    }
//
//    func didStartPlayingWithSuccess() {
//        print ("Playback started successfully")
//    }
//}

//extension ViewController: IHWaveFormViewDataSource {
//
////    func urlToPlay() -> URL {
////        var url : URL?
////        let path = Bundle.main.path(forResource: "bensound-sunny.mp3", ofType:nil)!
////        url = URL(fileURLWithPath: path)
////        return url!
////    }
//
//    func shouldPreRender() -> Bool {
//        return false
//    }
//
//}
