//
//  ThirdViewController.swift
//  1
//
//  Created by egor aleksandrovich on 13.12.2022.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var textViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var porgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        textView.isHidden = true
//        textView.alpha = 0
        
//        textView.text = ""
        textView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17)
        textView.backgroundColor = self.view.backgroundColor
        textView.layer.cornerRadius = 10
        
        stepper.value = 17
        stepper.minimumValue = 10
        stepper.maximumValue = 25
        
        stepper.tintColor = .white
        stepper.backgroundColor = .gray
        stepper.layer.cornerRadius = 5
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .gray
        activityIndicator.startAnimating()
        self.textView.isUserInteractionEnabled = false
        
        porgressView.setProgress(0, animated: true)
        
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
        // not work on third screen
//        UIView.animate(withDuration: 0, delay: 20, options: .curveLinear, animations: {
//            self.textView.alpha = 1
//        }) { (cool) in
//            self.activityIndicator.stopAnimating()
//            self.textView.isHidden = false
//            self.textView.isUserInteractionEnabled = true
//        }
        
        let _ = Timer.scheduledTimer(withTimeInterval: 0.005, repeats: true) { timer in
            if self.porgressView.progress != 1 {
                self.porgressView.progress += 0.0005
            } else {
                self.activityIndicator.stopAnimating()
                self.textView.isHidden = false
                self.textView.isUserInteractionEnabled = true
                self.porgressView.isHidden = true
                // stop Timer
                timer.invalidate()
            }
        }

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true) // скрытие клавиатуры вызванной для любого объекта
        
//        textView.resignFirstResponder() // скрытие клавиатуры вызванной для конкретного объекта
    }
    
    @objc func updateTextView(notification: Notification) {
        
        guard
            let userInfo = notification.userInfo as? [String: Any],
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            else { return }
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            textView.contentInset = UIEdgeInsets.zero
        } else {
            textView.contentInset = UIEdgeInsets(top: 0,
                                                 left: 0,
                                                 bottom: keyboardFrame.height - textViewBottomConstraint.constant,
                                                 right: 0)
            textView.scrollIndicatorInsets = textView.contentInset
        }
        
        textView.scrollRangeToVisible(textView.selectedRange)
    }
    
    @IBAction func sizeFont(_ sender: UIStepper) {
        let font = textView.font?.fontName
        let fontSize = CGFloat(sender.value)
        
        textView.font = UIFont(name: font!, size: fontSize)
    }
    
    @IBAction func unwindSegueToThirdVC(segue: UIStoryboardSegue) {
        
    }
    
}

extension ThirdViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = .white
        textView.textColor = .gray
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = self.view.backgroundColor
        textView.textColor = .black
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        countLabel.text = "\(textView.text.count)"
        return textView.text.count + (text.count - range.length) <= 240
    }
}
