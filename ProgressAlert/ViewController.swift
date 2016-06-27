//
//  ViewController.swift
//  ProgressAlert
//
//  Created by TakeruMizoguchi on 2016/06/25.
//  Copyright © 2016年 Takeru.Mizoguchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    weak var customUI : UIView?
    weak var buttonUI : UIButton?
    weak var timer : NSTimer?
    var destroyCount : Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        destroyCount = 0
        
        //Buttonの設定
        let myButton = UIButton()
        myButton.frame = CGRectMake(0, 0, 200, 40)
        myButton.layer.masksToBounds = true
        myButton.setTitle("UIAlertを発動", forState: UIControlState.Normal)
        myButton.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
        myButton.layer.cornerRadius = 10
        myButton.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        myButton.addTarget(self, action: #selector(ViewController.onClickMyButton(_:)), forControlEvents: .TouchUpInside)
        buttonUI = myButton
        //ButtonをViewに追加
        self.view.addSubview(buttonUI!)
                
        //NSTimer
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.update(_:)), userInfo: nil, repeats: true)
    }
    
    func onClickMyButton(sender : UIButton){
        sender.enabled = false;
        //Custom Alert Process
        let alertUI = CustomAlert()
        alertUI.uiSettings(view)
        //位置を管理可能にしている
        alertUI.getCustomUI().layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        customUI = alertUI.getCustomUI()
        view.addSubview(customUI!)
        
        alertUI.getButton().addTarget(self, action: #selector(CustomUIButton(_:)), forControlEvents: .TouchUpInside)
        alertUI.getLabel().text = "Test"
        alertUI.getButton().setTitle("OK", forState: UIControlState.Normal)
    }
    
    func CustomUIButton(sender : AnyObject){
        customUI?.removeFromSuperview()
        buttonUI!.enabled = true
    }
    
    func update(timer: NSTimer){

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

