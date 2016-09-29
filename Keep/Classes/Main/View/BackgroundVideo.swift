//
//  BackgroundVideo.swift
//  Keep
//
//  Created by 柯秉钧 on 2016/9/28.
//  Copyright © 2016年 柯秉钧. All rights reserved.
//

import Foundation
import AVKit
import AVFoundation
enum BackgroundVideoErrors:Error{
    case invaildVideo
}
class BackgroundVideo {
    var backGroundPlayer:AVPlayer?
    var videoURL:URL?
    var viewController:UIViewController?
    var hasBeenUser:Bool = false
    init(on viewController:UIViewController,withVideoURL URL:String) {
        self.viewController = viewController
        let videoNameAndExtension:[String]? = URL.characters.split{$0 == "."}.map(String.init)
        if videoNameAndExtension!.count == 2{
            if let videoName = videoNameAndExtension?[0],let videoExtension = videoNameAndExtension?[1]{
                if let url = Bundle.main.url(forResource: videoName, withExtension: videoExtension){
                    self.videoURL = url
                    self.backGroundPlayer = AVPlayer(url:self.videoURL!)
                }else{
                    KLog(BackgroundVideoErrors.invaildVideo)
                }
            }else{
                KLog("warong video name format")
            }
        }
    }
    deinit {
        if self.hasBeenUser{
            NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: nil)
            NotificationCenter.default.removeObserver(self, name: .UIApplicationWillEnterForeground, object: nil)
        }
    }
    func  setupBackground(){
        self.backGroundPlayer?.actionAtItemEnd = .none
        self.backGroundPlayer?.isMuted = true
    
        //添加视频到你的view
        let loginView:UIView = self.viewController!.view
        let playerLayer = AVPlayerLayer(player: self.backGroundPlayer)
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer.zPosition = -1
        playerLayer.frame = loginView.frame
        loginView.layer.addSublayer(playerLayer)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
        } catch {
            print("fialed setting AvAudioSession Category to  AVAudioSessionCategoryAmbient")
        }
        self.backGroundPlayer?.play()
        
        //循环播放视频,
        NotificationCenter.default.addObserver(self, selector: #selector(self.loopVideo), name: .AVPlayerItemDidPlayToEndTime, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.loopVideo), name: .UIApplicationWillEnterForeground, object: nil)
        self.hasBeenUser = true
    }
    @objc private func loopVideo(){
        self.backGroundPlayer?.seek(to: kCMTimeZero)
        self.backGroundPlayer?.play()
    }
    
    func pause(){
        self.backGroundPlayer?.pause()
    }
    func play(){
        self.backGroundPlayer?.play()
    }
}
