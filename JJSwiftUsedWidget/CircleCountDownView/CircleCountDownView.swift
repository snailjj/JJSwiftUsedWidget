//
//  CircleCountDownView.swift
//  Pods
//
//  Created by snailjj on 2018/12/12.
//

import UIKit

public protocol CircleCountDownViewDelegate: NSObjectProtocol {
    func didFinish()
}

public class CircleCountDownView: UIView {
    
    var timer: Timer?
    var count: Int = 0
    var currentCount: Int = 0
    var circleBgColor: UIColor = UIColor.gray
    var circleColor: UIColor = UIColor.red
    var width: CGFloat = 2
    var countLabel: UILabel!
    
    public weak var delegate: CircleCountDownViewDelegate?
    
    public init(frame: CGRect, circleBgColor: UIColor = UIColor.gray, circleColor: UIColor = UIColor.red, width: CGFloat = 2, seconds: Int,labelTextColor: UIColor = UIColor.red) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        self.circleBgColor = circleBgColor
        self.circleColor = circleColor
        self.width = width
        self.count = seconds * 100
        countLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width * 0.6, height: frame.width * 0.6))
        countLabel.center = self.center
        countLabel.textAlignment = .center
        countLabel.textColor = labelTextColor
        countLabel.font = UIFont.systemFont(ofSize: 10)
        addSubview(countLabel)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        let circle = UIBezierPath()
        circle.addArc(withCenter: CGPoint(x: rect.size.width / 2, y: rect.size.height / 2), radius: rect.width / 2 - width, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        circleBgColor.setStroke()
        circle.lineWidth = width
        circle.stroke()
        
        let colorCircle = UIBezierPath()
        colorCircle.addArc(withCenter: CGPoint(x: rect.size.width / 2, y: rect.size.height / 2), radius: rect.width / 2 - width, startAngle: 0, endAngle: CGFloat(currentCount) / CGFloat(count) * 2 * CGFloat.pi, clockwise: true)
        circleColor.setStroke()
        colorCircle.lineWidth = width
        colorCircle.stroke()
    }
    
    /// 开始
    public func start() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }

    @objc func countDown() {
        currentCount += 1
        countLabel.text = "\(Int(currentCount / 100))"
        if currentCount == count {
            delegate?.didFinish()
            print("结束，定时器销毁")
            timer?.invalidate()
            timer = nil
        }
        setNeedsDisplay()
    }
    
}
