//
//  AlertBarController.swift
//  AlertBarController
//
//  Created by Ary on 23/12/2020.
//  Copyright © 2020 Ary. All rights reserved.
//

import UIKit

class AlertBarController: UIViewController {

    var style:AlertStyle = .normal {
        
        didSet{
            self.configureStyle(style: self.style)
        }
    }
    var alertType: AlertType = .info {
        
        didSet {
            
            self.setAlertType()
        }
    }
    var delayMessage:TimeInterval = 1.5
    var iconColor: UIColor = #colorLiteral(red: 0.2615796626, green: 0.7009890079, blue: 0.9851786494, alpha: 1)
    var iconText: String = "ℹ︎"
    var textMessage = String()
    var messageLabel: UILabel!
    var messageIcon: UILabel!
    var containerView: UIView!

    
    private func configureAlertType(alertType:AlertType) {
        
        switch alertType {
        case .info:
            iconColor = #colorLiteral(red: 0.2615796626, green: 0.7009890079, blue: 0.9851786494, alpha: 1)
            iconText = "ℹ︎"
        case .success:
            iconColor = #colorLiteral(red: 0.07621899992, green: 0.728233397, blue: 0.1701744199, alpha: 1)
            iconText = "✓"
        case .warning:
            iconColor = #colorLiteral(red: 0.9982122779, green: 0.7409037352, blue: 0.1804661751, alpha: 1)
            iconText = "!"
        case .error:
            iconColor = #colorLiteral(red: 0.9844391942, green: 0.3309136629, blue: 0.2950443923, alpha: 1)
            iconText = "✖︎"
        }
    }
    
    private func configureStyle(style: AlertStyle) {
        
        switch self.style {
        case .normal:
            containerView.backgroundColor = .white
            containerView.layer.borderColor = UIColor.darkGray.cgColor
            messageLabel.textColor = .black
        case .dark:
            containerView.backgroundColor = .darkGray
            containerView.layer.borderColor = UIColor.black.cgColor
            messageLabel.textColor = .white
        }
    }
    
    private func setAlertType() {
        
        switch alertType {
        case .info:
            messageIcon.backgroundColor = #colorLiteral(red: 0.2615796626, green: 0.7009890079, blue: 0.9851786494, alpha: 1)
            messageIcon.text = "ℹ︎"
        case .success:
            messageIcon.backgroundColor = #colorLiteral(red: 0.07621899992, green: 0.728233397, blue: 0.1701744199, alpha: 1)
            messageIcon.text = "✓"
        case .warning:
            messageIcon.backgroundColor = #colorLiteral(red: 0.9982122779, green: 0.7409037352, blue: 0.1804661751, alpha: 1)
            messageIcon.text = "!"
        case .error:
            messageIcon.backgroundColor = #colorLiteral(red: 0.9844391942, green: 0.3309136629, blue: 0.2950443923, alpha: 1)
            messageIcon.text = "✖︎"
        }
    }
    
    private func initializeViews() {
        
        self.modalPresentationStyle = .overCurrentContext
       
        let width = self.view.bounds.width
        let height = self.view.bounds.height * 0.12
        let y = self.view.bounds.height - height
        containerView = UIView(frame: CGRect(x: 0, y: y, width: width, height: height))
        containerView.layer.borderWidth = 0.5
        view.addSubview(containerView)
        
        messageLabel = UILabel(frame: CGRect(x: 60, y: 30, width: 300, height: 21))
        messageLabel.font = UIFont.systemFont(ofSize: 15)
        messageLabel.text = textMessage
        
        messageIcon  = UILabel(frame: CGRect(x: 10, y: 24, width: 30, height: 30))
        self.configureAlertType(alertType: self.alertType)
        messageIcon.text = iconText
        messageIcon.backgroundColor = iconColor
        messageIcon.textColor = .white
        messageIcon.textAlignment = .center
        messageIcon.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        messageIcon.layer.cornerRadius = 15
        messageIcon.layer.masksToBounds = true
        
        containerView.addSubview(messageLabel)
        containerView.addSubview(messageIcon)
        

        self.configureStyle(style: self.style)
       
    }
    
    convenience init(message: String) {
        self.init()
        self.textMessage = message
        self.initializeViews()
    }
    
    convenience init(message: String, alertType: AlertType) {
        self.init()
        self.textMessage = message
        self.alertType = alertType
        self.initializeViews()
    }
    
    convenience init(message: String, alertType: AlertType, style:AlertStyle) {
        self.init()
        self.textMessage = message
        self.alertType = alertType
        self.style = style
        self.initializeViews()
    }
    
    convenience init(message: String, alertType: AlertType, style:AlertStyle, delay: TimeInterval) {
        self.init()
        self.textMessage = message
        self.alertType = alertType
        self.delayMessage = delay
        self.initializeViews()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Timer.scheduledTimer(withTimeInterval: delayMessage, repeats: false, block: ({ timer in
            
            self.dismiss(animated: true, completion: nil)
            
        }))
    }
    
}

enum AlertType {
    case info
    case success
    case warning
    case error
}

enum AlertStyle {
    case normal
    case dark
}
