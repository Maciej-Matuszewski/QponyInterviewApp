//
//  CustomButton.swift
//  QponyInterviewApp
//
//  Created by Maciej Matuszewski on 20.08.2016.
//  Copyright © 2016 Maciej Matuszewski. All rights reserved.
//

import UIKit

class CustomButton: UIView {

    var states: [state] = []
    let titleLabel = UILabel.init()
    var currentState = 0
    
    var stateWillChangeEvent : (() -> Void) = {() -> Void in
        print("State will change state!")
    }
    
    var stateDidChangeEvent : (() -> Void) = {() -> Void in
        print("State did change state!")
    }
    
    init(states: [state]){
        super.init(frame: CGRect.zero)
        
        self.layer.cornerRadius = 5
        
        self.states = states
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.textAlignment = .Center
        self.titleLabel.adjustsFontSizeToFitWidth = true
        self.titleLabel.font = Constants.kFontHeader
        self.addSubview(self.titleLabel)
        
        self.addConstraints([
            NSLayoutConstraint.init(
                item: self.titleLabel,
                attribute: NSLayoutAttribute.Left,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self,
                attribute: NSLayoutAttribute.Left,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.titleLabel,
                attribute: NSLayoutAttribute.Right,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self,
                attribute: NSLayoutAttribute.Right,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.titleLabel,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.titleLabel,
                attribute: NSLayoutAttribute.Bottom,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self,
                attribute: NSLayoutAttribute.Bottom,
                multiplier: 1.0,
                constant: 0)
            ])
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(self.changeState))
        self.addGestureRecognizer(tapGesture)
        
        guard
        let stateFirst = self.states.first
            else{
                return
        }
        
        self.backgroundColor = stateFirst.color
        self.titleLabel.textColor = stateFirst.color.isLight() ? UIColor.darkTextColor() : UIColor.whiteColor()
        self.titleLabel.text = stateFirst.titleText
        
        
    }
    
    func addState(state: CustomButton.state){
        self.states.append(state)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func changeState(){
        
        if self.states.count == 0{
            return
        }
        
        self.stateWillChangeEvent()
        
        self.currentState = self.currentState + 1 < self.states.count ? self.currentState + 1 : 0
        
        
        UIView.animateWithDuration(
            0.05,
            animations: { 
                self.transform = CGAffineTransformMakeScale(0.9, 0.9)
                self.backgroundColor = self.states[self.currentState].color
                self.titleLabel.textColor = self.states[self.currentState].color.isLight() ? UIColor.darkTextColor() : UIColor.whiteColor()
                self.titleLabel.text = self.states[self.currentState].titleText
            }) { (_) in
                UIView.animateWithDuration(
                    0.05,
                    animations: {
                        self.transform = CGAffineTransformMakeScale(1.0, 1.0)
                })
        }
        
        self.stateDidChangeEvent()
    }

    struct state {
        var color : UIColor
        var titleText: String
        
        init(color: UIColor, titleText: String) {
            self.color = color
            self.titleText = titleText
        }
    }
    
}

