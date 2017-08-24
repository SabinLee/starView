//
//  EvaluateStarView.swift
//  PanningMan
//
//  Created by 喜汇-Lee on 2017/4/12.
//  Copyright © 2017年 喜汇. All rights reserved.
//

import UIKit

protocol EvaluateStarViewDelegate {
    func evaluateStarView(_ evaluateStarView: EvaluateStarView, progressChangedTo progress: Float)
}

@IBDesignable
class EvaluateStarView: UIView {
    
    @IBOutlet weak var fgView: UIView!
    
    lazy var evaluateStarView: UIView = {
        let evaluateStarView = UINib(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self))).instantiate(withOwner: self, options: nil).first as! UIView
        evaluateStarView.frame = self.bounds
        return evaluateStarView
    }()
    
    var delegate: EvaluateStarViewDelegate?
    
// MARK:- 初始化方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    func setupSubviews() {
        
        addSubview(evaluateStarView)
        //给前景view加一个拖动手势
        let pan = UIPanGestureRecognizer(target: self, action: #selector(self.pan(pan:)))
        self.addGestureRecognizer(pan)
        
        //点击手势
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tap(tap:)))
        self.addGestureRecognizer(tap)
    }
    
    func tap(tap: UITapGestureRecognizer) {
        let point = tap.location(in: self)
        changeForegroundViewWidthTo(point)
        
    }
    
    func pan(pan: UIPanGestureRecognizer) {
        
        let point = pan.location(in: self)
        changeForegroundViewWidthTo(point)
    }
    
    func changeForegroundViewWidthTo(_ point: CGPoint) {
        guard point.x > 0 && point.x < frame.width else {
            return
        }
        let halfWidth = frame.width / 10
        var fgViewWidth = CGFloat(Float((Int(point.x / halfWidth) + 1 ))) * halfWidth
        if point.x <= halfWidth / 2 {
            fgViewWidth = 0
        }
        //改变前景view的宽度让它看起来被设置了评分
        fgView.frame.size.width = fgViewWidth
        delegate?.evaluateStarView(self, progressChangedTo: Float(fgViewWidth / frame.width))
    }

}
