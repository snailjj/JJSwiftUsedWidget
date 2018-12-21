//
//  ViewController.swift
//  JJSwiftUsedWidget
//
//  Created by snailjj on 12/12/2018.
//  Copyright (c) 2018 snailjj. All rights reserved.
//


import UIKit
import JJSwiftUsedWidget

class ChildViewController: UIViewController {
    
    var function = MainFunction.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ChildViewController {
    func setup() {
        switch function {
        case .paymentCodeInputView:
            paymentCodeInput()
        case .circleCountDownView:
            circleCountDown()
        default:
            print("")
        }
    }
}

extension ChildViewController: CircleCountDownViewDelegate {
    func didFinish() {
        print("完成")
    }
    
    func circleCountDown() {
        let circleView = CircleCountDownView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), circleBgColor: UIColor.blue, circleColor: UIColor.red, width: 2, seconds: 10)
        circleView.center = view.center
        circleView.delegate = self
        view.addSubview(circleView)
        
        circleView.start()
    }
}

extension ChildViewController: PaymentCodeInputViewDelegate {
    
    func paymentCodeInput() {
        let paymentCodeInputView = PaymentCodeInputView(frame: CGRect(x: 0, y: 0, width: 180, height: 30))
        paymentCodeInputView.backgroundColor = UIColor.white
        paymentCodeInputView.layer.borderColor = UIColor.gray.cgColor
        paymentCodeInputView.layer.borderWidth = 1
        paymentCodeInputView.layer.cornerRadius = 3
        paymentCodeInputView.verticalBarColor = UIColor.red
        paymentCodeInputView.lengthOfPassword = 6
        paymentCodeInputView.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
        paymentCodeInputView.delegate = self
        self.view.addSubview(paymentCodeInputView)
    }
    
    func inputing(view: PaymentCodeInputView, pswString: String) {
        print(pswString)
    }
    
    func complete(view: PaymentCodeInputView, pswString: String) {
        print("PaymentCodeInputView----\(pswString)")
    }
}
