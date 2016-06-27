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
    weak var customUI : UIView?
    func getCustomUI() -> UIView{ return customUI! }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addUI()
    }
    
    func addUI() {
        // XIB読み込み
        customUI = NSBundle.mainBundle().loadNibNamed("CustomAlert", owner: self, options: nil).first as! UIView
        //view.layer.position = CGPoint(x: view.frame.maxX/2, y: view.frame.maxY/2)
        //丸みをもたす
        customUI!.layer.cornerRadius = 10
        //影をつける
        customUI!.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        //影の濃さ
        customUI!.layer.shadowOpacity = 0.1
        addSubview(customUI!)
        
        //ProgressViewを追加する
        addProgressView(customUI!)
    }
    
    func addProgressView(view : UIView){
        let margin:CGFloat = 10.0
        let rect = CGRectMake(margin, view.bounds.height/2, view.bounds.width - margin * 2.0 , 2.0)
        let progressView = UIProgressView(frame: rect)
        progressView.progress = 0.0
        progressView.setProgress(1.0, animated: true)
        progressView.tintColor = UIColor.blueColor()
        progressView.bringSubviewToFront(progressView)
        view.addSubview(progressView)
    }
}