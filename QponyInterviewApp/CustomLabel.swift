//
//  CustomLabel.swift
//  QponyInterviewApp
//
//  Created by Maciej Matuszewski on 20.08.2016.
//  Copyright © 2016 Maciej Matuszewski. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

    init(sublabelText: String, separatorLeft: Bool, separatorRight: Bool){
        super.init(frame: CGRect.zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = .Center
        self.textColor = Constants.kColorLightFont
        self.font = Constants.kFontHeader
        
        let subLabel = UILabel.init()
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.textColor = Constants.kColorGrayFont
        subLabel.font = Constants.kFontSmall
        subLabel.text = sublabelText
        subLabel.textAlignment = .Center
        self.addSubview(subLabel)
        
        self.addConstraints([
            NSLayoutConstraint.init(
                item: subLabel,
                attribute: NSLayoutAttribute.CenterX,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self,
                attribute: NSLayoutAttribute.CenterX,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: subLabel,
                attribute: NSLayoutAttribute.Bottom,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self,
                attribute: NSLayoutAttribute.Bottom,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: subLabel,
                attribute: NSLayoutAttribute.Height,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self,
                attribute: NSLayoutAttribute.Height,
                multiplier: 0.5,
                constant: 0)
            ])
        
        if separatorLeft {
            let leftSeparator = UIView.init()
            leftSeparator.translatesAutoresizingMaskIntoConstraints = false
            leftSeparator.backgroundColor = Constants.kColorLightFont
            self.addSubview(leftSeparator)
            
            self.addConstraints([
                NSLayoutConstraint.init(
                    item: leftSeparator,
                    attribute: NSLayoutAttribute.CenterX,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.Left,
                    multiplier: 1.0,
                    constant: 0),
                NSLayoutConstraint.init(
                    item: leftSeparator,
                    attribute: NSLayoutAttribute.Width,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: nil,
                    attribute: NSLayoutAttribute.Width,
                    multiplier: 1.0,
                    constant: 1),
                NSLayoutConstraint.init(
                    item: leftSeparator,
                    attribute: NSLayoutAttribute.CenterY,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.CenterY,
                    multiplier: 1.0,
                    constant: 0),
                NSLayoutConstraint.init(
                    item: leftSeparator,
                    attribute: NSLayoutAttribute.Height,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.Height,
                    multiplier: 0.7,
                    constant: 0)
                ])
            
        }
        
        if separatorRight {
            let rightSeparator = UIView.init()
            rightSeparator.translatesAutoresizingMaskIntoConstraints = false
            rightSeparator.backgroundColor = Constants.kColorLightFont
            self.addSubview(rightSeparator)
            
            self.addConstraints([
                NSLayoutConstraint.init(
                    item: rightSeparator,
                    attribute: NSLayoutAttribute.CenterX,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.Right,
                    multiplier: 1.0,
                    constant: 0),
                NSLayoutConstraint.init(
                    item: rightSeparator,
                    attribute: NSLayoutAttribute.Width,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: nil,
                    attribute: NSLayoutAttribute.Width,
                    multiplier: 1.0,
                    constant: 1),
                NSLayoutConstraint.init(
                    item: rightSeparator,
                    attribute: NSLayoutAttribute.CenterY,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.CenterY,
                    multiplier: 1.0,
                    constant: 0),
                NSLayoutConstraint.init(
                    item: rightSeparator,
                    attribute: NSLayoutAttribute.Height,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.Height,
                    multiplier: 0.7,
                    constant: 0)
                ])
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
