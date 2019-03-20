//
//  GradientCell.swift
//  GradientCell
//
//  Created by Alex Golovaschenko on 3/20/19.
//  Copyright © 2019 Alex Golovaschenko. All rights reserved.
//

import UIKit

final class GradientCell: UITableViewCell {
    
    var gradientLayer = CAGradientLayer()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCell()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    private func setupCell() {
        setupGradientLayer()
        setupLabel()
        setupLayer()
    }
    
    private func setupLayer() {
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.masksToBounds = true
//        self.layer.shouldRasterize = true
//        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    private func setupLabel() {
        self.textLabel!.font = UIFont.systemFont(ofSize: 15.0)
        self.textLabel!.numberOfLines = 0
        self.textLabel!.lineBreakMode = .byWordWrapping
    }
    
    private func setupGradientLayer() {
        self.gradientLayer.colors = [
            UIColor.black,
            UIColor.black.withAlphaComponent(0),
            UIColor.black.withAlphaComponent(0),
            UIColor.black
            ] .map{ $0.cgColor }
        self.gradientLayer.locations = [0, 0.1, 0.9, 1.0]
        self.gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        self.gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        self.gradientLayer.shouldRasterize = true
        self.gradientLayer.rasterizationScale = UIScreen.main.scale
        
        self.gradientLayer.frame = self.layer.bounds
        self.layer.addSublayer(self.gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.gradientLayer.frame = self.layer.bounds
        self.gradientLayer.removeAllAnimations()
    }

    static var reuseIdentifier: String {
        return "GradientCell"
    }
}

