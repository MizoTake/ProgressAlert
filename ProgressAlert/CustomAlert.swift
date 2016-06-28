//
//  CustomAlert.swift
//  ProgressAlert
//
//  Created by TakeruMizoguchi on 2016/06/26.
//  Copyright © 2016年 Takeru.Mizoguchi. All rights reserved.
//

import UIKit

class CustomAlert : UIView {
    
    //自身
    weak var customUI : UIVisualEffectView?
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    
    weak var timer : NSTimer?
    var progressPar : Float? = 0.0 {
        didSet{
            if(progressPar >= 1.5){
                customUI?.removeFromSuperview()
            }
        }
    }
    var increasesPar : Float? = 0.0
    
    //ゲッター
    func getButton() -> UIButton{ return button! }
    func getLabel() -> UILabel{ return label! }
    func getProgress() -> UIProgressView{ return progress! }
    func getCustomUI() -> UIView{ return customUI! }
    
    //必須initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        progressPar = 0.0
        increasesPar = Float(arc4random_uniform(10) + 1)/100.0
        //NSTimer
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.update(_:)), userInfo: nil, repeats: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //NSTimer
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.update(_:)), userInfo: nil, repeats: true)
    }
    
    //uiの設定
    func uiSettings(view : UIView) {
        // XIB読み込み
        customUI = NSBundle.mainBundle().loadNibNamed("CustomAlert", owner: self, options: nil).first as? UIVisualEffectView
        //丸みをもたす
        customUI!.layer.cornerRadius = 10
        //丸角を許可する
        customUI!.clipsToBounds = true
        //影をつける
        customUI!.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        //影の濃さ
        customUI!.layer.shadowOpacity = 0.1
    }
    
    func update(timer: NSTimer){
        if(progress != nil){
            progress.setProgress(progressPar!, animated: true)
            progressPar = progressPar! + Float(increasesPar!)
        }
    }
    
}