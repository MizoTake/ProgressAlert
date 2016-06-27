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
    
    //ゲッター
    func getButton() -> UIButton{ return button! }
    func getLabel() -> UILabel{ return label! }
    func getProgress() -> UIProgressView{ return progress! }
    func getCustomUI() -> UIView{ return customUI! }
    
    //必須initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //uiの設定
    func uiSettings(view : UIView) {
        // XIB読み込み
        customUI = NSBundle.mainBundle().loadNibNamed("CustomAlert", owner: self, options: nil).first as? UIVisualEffectView
        //view.layer.position = CGPoint(x: view.frame.maxX/2, y: view.frame.maxY/2)
        //丸みをもたす
        customUI!.layer.cornerRadius = 10
        //影をつける
        customUI!.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        //影の濃さ
        customUI!.layer.shadowOpacity = 0.1
    }
    
}