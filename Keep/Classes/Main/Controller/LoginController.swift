//
//  LoginController.swift
//  Keep
//
//  Created by 柯秉钧 on 2016/9/29.
//  Copyright © 2016年 柯秉钧. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    @IBAction func click(_ sender:AnyObject){
        if let vc = parent?.childViewControllers[0] as? LoginViewController{
            vc.timer.invalidate()
            vc.backgroundPlayer = nil
            UIApplication.shared.keyWindow?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        KLog(self.parent?.childViewControllers[0])
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
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
