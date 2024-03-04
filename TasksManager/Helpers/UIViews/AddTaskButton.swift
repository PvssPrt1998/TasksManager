//
//  AddTaskButton.swift
//  TasksManager
//
//  Created by Николай Щербаков on 04.03.2024.
//

import UIKit

final class AddTaskButton: UIButton {
    
    private var shadowLayer = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.insertSublayer(shadowLayer, at: 0)
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "plus")
        config.baseForegroundColor = .darkGray
        configuration = config
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupDefaultLayer()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.shadowLayer.removeFromSuperlayer()
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        layer.insertSublayer(shadowLayer, at: 0)
        super.touchesEnded(touches, with: event)
    }
    
    func setupDefaultLayer() {
        let cornerRadius: CGFloat = bounds.width / 2
        
        //shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = UIColor.white.cgColor
        shadowLayer.shadowColor = UIColor.darkGray.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        shadowLayer.shadowOpacity = 0.8
        shadowLayer.shadowRadius = 2
        
        layer.cornerRadius = cornerRadius
//        layer.insertSublayer(shadowLayer, at: 0)
    }
    
    func removeShadow() {
        shadowLayer.shadowOpacity = 0
    }
    
    func returnShadow() {
        shadowLayer.shadowOpacity = 0.8
    }
}


