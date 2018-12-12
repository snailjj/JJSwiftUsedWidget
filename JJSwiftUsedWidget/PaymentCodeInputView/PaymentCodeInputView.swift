//
//  PaymentCodeInputView.swift
//  JJSwiftUsedWidget
//
//  Created by snailjj on 2018/11/27.
//

import UIKit

public protocol PaymentCodeInputViewDelegate: NSObjectProtocol {
    func complete(view: PaymentCodeInputView, pswString: String)
    func inputing(view: PaymentCodeInputView, pswString: String)
}

public class PaymentCodeInputView: UIView {
    
    public var lengthOfPassword: Int = 6                        //默认输入6位密码
    public var verticalBarColor: UIColor = UIColor.gray         //里面竖线的颜色
    public weak var delegate: PaymentCodeInputViewDelegate!
    
    private var inputItems: [InputItemView]!                    //item的数量，它的数量=lengthOfPassword
    private var password: String = ""                           //密码
    private var txtField: UITextField!                          //输入框
    private var itemHeight: CGFloat!                            //item的高度
    private var itemWidth: CGFloat!                             //item的宽度
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configation()
        initUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - public methods
extension PaymentCodeInputView {
    public func reset() {
        txtField.text = ""
        password = ""
        inputItems.enumerated().forEach { (index, item) in
            item.circleLabel.isHidden = !(index < (txtField.text?.count)!)
        }
        delegate.complete(view: self, pswString: password)
    }
}

//MARK: - private methods
extension PaymentCodeInputView {
    
    func configation() {
        NotificationCenter.default.addObserver(self, selector: #selector(inputAction(noti:)), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
        inputItems = [InputItemView]()
        itemWidth = frame.size.width / CGFloat(lengthOfPassword)
        itemHeight = frame.size.height
        txtField = UITextField(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        txtField.borderStyle = .none
        txtField.isHidden = true
        txtField.returnKeyType = .done
        txtField.keyboardType = .numberPad
        txtField.becomeFirstResponder()
        addSubview(txtField)
    }
    
    func initUI() {
        for i in 0 ..< lengthOfPassword {
            let item = InputItemView(frame: CGRect(x: CGFloat(i) * itemWidth, y: 0, width: itemWidth, height: itemHeight))
            item.circleLabel.isHidden = true
            item.rightLineLabel.isHidden = i == (lengthOfPassword - 1)
            item.rightLineLabel.backgroundColor = verticalBarColor
            inputItems.append(item)
            addSubview(item)
        }
        
    }
    
    @objc func inputAction(noti: Notification) {
        if !txtField.text!.isEmpty {
            //如果不是数字
            if !txtField.text!.isDigit() {
                
            } else {
                //是数字
                password = txtField.text!
            }
        } else {
            password = ""
        }
        if password.count > lengthOfPassword {
            password.removeLast()
            txtField.text = password
            return
        } else if password.count < lengthOfPassword {
            delegate?.inputing(view: self, pswString: password)
        } else {
            delegate?.complete(view: self, pswString: password)
        }
        inputItems.enumerated().forEach { (index, item) in
            item.circleLabel.isHidden = !(index < (txtField.text?.count)!)
        }
    }
    
}

extension String {
    //判断字符串是否是数字
    func isDigit() -> Bool{
        var result = false
        if let _ = Int(self) {
            result = true
        }
        return result
    }
}
