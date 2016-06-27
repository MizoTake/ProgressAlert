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
    weak var timer : NSTimer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.¥
        //NSTimer 繰り返すメソッドを決める
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.update(_:)), userInfo: nil, repeats: true)
    }
    
    func instanceCustomView(){
        //Custom Alert Process
        let alertUI = CustomAlert()
        alertUI.uiSettings(view)
        //位置を管理可能にしている
        let w = arc4random_uniform(UInt32(self.view.frame.width))
        let h = arc4random_uniform(UInt32(self.view.frame.height))
        alertUI.getCustomUI().layer.position = CGPoint(x: CGFloat(w), y: CGFloat(h))
        customUI = alertUI.getCustomUI()
        //表示
        view.addSubview(customUI!)
        //setup
        alertUI.getButton().addTarget(self, action: #selector(CustomUIButton(_:)), forControlEvents: .TouchUpInside)
        alertUI.getLabel().text = "Test"
        alertUI.getButton().setTitle("OK", forState: UIControlState.Normal)
    }
    
    func CustomUIButton(sender : AnyObject){
        customUI?.removeFromSuperview()
    }
    
    func update(timer: NSTimer){
        instanceCustomView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

