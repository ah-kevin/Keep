//
//  LoginViewController.swift
//  Keep
//
//  Created by 柯秉钧 on 2016/9/28.
//  Copyright © 2016年 柯秉钧. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController ,UIScrollViewDelegate{
    var backgroundPlayer:BackgroundVideo?
    var pagetitles = ["规范你的训练过程","陪伴你跑出的第一步","分享汗水后你的性感","全面记录你的健康数据"]
    var timer:Timer!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scorllView: UIScrollView! //实现文字的滚动
    @IBOutlet weak var scrollH: NSLayoutConstraint!
    @IBOutlet weak var scrollW: NSLayoutConstraint!
    
    @IBAction func aaa(_ sender: AnyObject) {
        timer.invalidate()
        backgroundPlayer = nil
        UIApplication.shared.keyWindow?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
    }
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundPlayer = BackgroundVideo(on: self, withVideoURL: "intro_video.mp4")
        backgroundPlayer?.setupBackground()
        // Do any additional setup after loading the view.
        pageControl.currentPage = index
        textGallery()
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(LoginViewController.nextText), userInfo: nil, repeats: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        
    }
    
    private func textGallery(){ //实现文字的滚动
        let textY:CGFloat = 0
        for index in 0..<pagetitles.count{
            let pagetitle = UILabel()
            let textX = CGFloat(index)*scrollW.constant
            //设置label的大小，注意label和ScrollView的关系，其实几张图片是按顺序从左向右依次放置在ScrollView中的，但是ScrollView在界面中显示的只是一个的大小，效果类似与画廊；
            pagetitle.frame = CGRect(x: textX, y: textY, width: scrollW.constant, height: scrollH.constant)
            pagetitle.text = pagetitles[index]
            pagetitle.textColor = UIColor.white
            pagetitle.textAlignment = .center
            scorllView.showsHorizontalScrollIndicator = false
            scorllView.addSubview(pagetitle)
        }
        ////需要非常注意的是：ScrollView控件一定要设置contentSize;包括长和宽
        let contentW = scrollW.constant * CGFloat(pagetitles.count)
        scorllView.contentSize = CGSize(width: contentW, height: 0)
        scorllView.isPagingEnabled = true
        scorllView.delegate = self
        pageControl.numberOfPages = pagetitles.count
    }
    func nextText(){
        var page = pageControl.currentPage
        if page == 3{
            page = 0
        }else{
            page += 1
        }
        let x = CGFloat(page) * scrollW.constant
        scorllView.contentOffset = CGPoint(x: x, y: 0)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollviewW = scorllView.frame.size.width
        let x = scorllView.contentOffset.x
        let page = Int((x+scrollviewW/2)/scrollviewW)
        pageControl.currentPage = page
    }
    deinit {
        KLog("deinit LoginView")
        timer.invalidate()
    }
    
    // MARK: - Navigation
    
    @IBAction func close(segue:UIStoryboardSegue){
        //        if segue.source is LoginController{
        //            timer.invalidate()
        //            backgroundPlayer = nil
        //            UIApplication.shared.keyWindow?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        //
        //        }
            self.timer.invalidate()
            self.backgroundPlayer = nil
            UIApplication.shared.keyWindow?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
    }
    
}
