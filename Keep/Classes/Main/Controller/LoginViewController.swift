//
//  LoginViewController.swift
//  Keep
//
//  Created by 柯秉钧 on 2016/9/28.
//  Copyright © 2016年 柯秉钧. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var backgroundPlayer:BackgroundVideo?
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pagetitle: UILabel!
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundPlayer = BackgroundVideo(on: self, withVideoURL: "intro_video.mp4")
        backgroundPlayer?.setupBackground()
        // Do any additional setup after loading the view.
        pageControl.currentPage = index
        switch index {
        case 0:
            pagetitle.text = "规范你的训练过程"
        case 1:
            pagetitle.text = "陪伴你跑出的第一步"
        case 2:
            pagetitle.text = "分享汗水后你的性感"
        case 3:
            pagetitle.text = "全面记录你的健康数据"
        default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
