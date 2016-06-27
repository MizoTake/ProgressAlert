//
//  ViewController.swift
//  ProgressAlert
//
//  Created by TakeruMizoguchi on 2016/06/25.
//  Copyright © 2016年 Takeru.Mizoguchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    weak var timer : NSTimer?
    weak var customUI : UIView?
    var destroyCount : Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        destroyCount = 0
        
        //Buttonの設定
        let myButton = UIButton()
        myButton.frame = CGRectMake(0, 0, 200, 40)
        myButton.backgroundColor = UIColor.redColor()
        myButton.layer.masksToBounds = true
        myButton.setTitle("UIAlertを発動", forState: UIControlState.Normal)
        myButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton.layer.cornerRadius = 10
        myButton.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        myButton.addTarget(self, action: #selector(ViewController.onClickMyButton(_:)), forControlEvents: .TouchUpInside)
        //ButtonをViewに追加
        self.view.addSubview(myButton)
                
        //NSTimer
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.update(_:)), userInfo: nil, repeats: true)
    }
    
    func onClickMyButton(sender : UIButton){
        //Custom Alert Process
        let cUI = CustomAlert()
        //位置を管理可能にしている
        cUI.getCustomUI().layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        view.addSubview(cUI)
        customUI = cUI
    }
    
    func update(timer: NSTimer){
        if(self.customUI != nil){
            self.destroyCount = self.destroyCount! + 1
            if(self.destroyCount > 3){
                customUI?.removeFromSuperview()
                destroyCount = 0
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

