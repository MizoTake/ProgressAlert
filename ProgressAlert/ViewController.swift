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
    var uis : Array<CustomAlert> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.¥
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "iosbackground.jpeg")?.drawInRect(self.view.bounds)
        let image: UIImage! = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        
        //一定時間後に処理を行う
        let delay = 1 * Double(NSEC_PER_SEC)
        let time  = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            //NSTimer 繰り返すメソッドを決める
            self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.update(_:)), userInfo: nil, repeats: true)
        })
    }
    
    func instanceCustomView(){
        //Custom Alert Process
        let alertUI = CustomAlert()
        alertUI.uiSettings(view)
        //位置をランダムで決定する
        let w = arc4random_uniform(UInt32(self.view.frame.width))
        let h = arc4random_uniform(UInt32(self.view.frame.height))
        alertUI.getCustomUI().layer.position = CGPoint(x: CGFloat(w), y: CGFloat(h))
        uis += [alertUI]
        //表示
        view.addSubview(uis[uis.count - 1].getCustomUI())
        //setup
        alertUI.getButton().addTarget(self, action: #selector(CustomUIButton(_:)), forControlEvents: .TouchUpInside)
        alertUI.getLabel().text = "Warning!!"
        alertUI.getButton().setTitle("Cancel", forState: UIControlState.Normal)
    }
    
    func CustomUIButton(sender : AnyObject){
        var cnt = 0
        for ui in uis {
            if(sender.isEqual(ui.getButton())){
                uis.removeAtIndex(cnt)
                ui.getCustomUI().removeFromSuperview()
                break
            }
            cnt += 1
        }
    }
    
    func update(timer: NSTimer){
        instanceCustomView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

