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
        
        let v: CGFloat = -0.99
        let vHole: CGFloat = -1
        
        let p1 = UIBezierPath(roundedRect: bounds.offsetBy(dx: v, dy: v), cornerRadius: cornerRadius)
        let hole = UIBezierPath(roundedRect: bounds.insetBy(dx: vHole, dy: vHole), cornerRadius: cornerRadius).reversing()
        p1.append(hole)
        shadowLayer.path = p1.cgPath
        shadowLayer.fillColor = UIColor.clear.cgColor
        shadowLayer.shadowColor = UIColor.darkGray.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 2, height: 2)
        shadowLayer.shadowOpacity = 0.3
        shadowLayer.shadowRadius = 1
        
        layer.cornerRadius = cornerRadius
        layer.backgroundColor = UIColor.white.withAlphaComponent(0.6).cgColor
    }
}

extension Int {
    var degreesToRadians: CGFloat {
        return CGFloat(self) * .pi / 180
    }
}
