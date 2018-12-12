//
//  InputItemView.swift
//  JJSwiftUsedWidget
//
//  Created by snailjj on 2018/11/27.
//

import UIKit

public class InputItemView: UIView {
    
    var rightLineLabel: UILabel!
    var circleLabel: UILabel!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension InputItemView {
    
    func initUI() {
        rightLineLabel = UILabel(frame: CGRect(x: frame.size.width - 1, y: 0, width: 1, height: frame.size.height))
        rightLineLabel.center = CGPoint(x: frame.size.width - 1, y: frame.size.height / 2)
        rightLineLabel.text = ""
        addSubview(rightLineLabel)
        
        circleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 10) )
        circleLabel.center = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        circleLabel.layer.cornerRadius = 5
        circleLabel.layer.masksToBounds = true
        circleLabel.backgroundColor = UIColor(red: 51 / 255.0, green: 51 / 255.0, blue: 51 / 255.0, alpha: 1.0)
        addSubview(circleLabel)
    }
    
}
