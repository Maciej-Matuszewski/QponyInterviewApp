//
//  CustomButtonExampleViewController.swift
//  QponyInterviewApp
//
//  Created by Maciej Matuszewski on 20.08.2016.
//  Copyright © 2016 Maciej Matuszewski. All rights reserved.
//

import UIKit

class CustomButtonExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Constants.kColorBackground
        
        let buttonOne = CustomButton.init(states:
            [
                CustomButton.state.init(color: UIColor.whiteColor(), titleText: "Three"),
                CustomButton.state.init(color: UIColor.grayColor(), titleText: "Two"),
                CustomButton.state.init(color: UIColor.blackColor(), titleText: "ONE!!!")
            ]
        )
        
        buttonOne.translatesAutoresizingMaskIntoConstraints = false
        buttonOne.stateDidChangeEvent = {() -> Void in
            print("Custom action after state change!")
        }
        self.view.addSubview(buttonOne)
        
        self.view.addConstraints([
            NSLayoutConstraint.init(
                item: buttonOne,
                attribute: NSLayoutAttribute.CenterX,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.view,
                attribute: NSLayoutAttribute.CenterX,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: buttonOne,
                attribute: NSLayoutAttribute.CenterY,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.view,
                attribute: NSLayoutAttribute.CenterY,
                multiplier: 0.5,
                constant: 0),
            NSLayoutConstraint.init(
                item: buttonOne,
                attribute: NSLayoutAttribute.Width,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.view,
                attribute: NSLayoutAttribute.Width,
                multiplier: 0.7,
                constant: 0),
            NSLayoutConstraint.init(
                item: buttonOne,
                attribute: NSLayoutAttribute.Height,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.view,
                attribute: NSLayoutAttribute.Height,
                multiplier: 0.1,
                constant: 0),
            ]
        )
        
        let buttonTwo = CustomButton.init(states:
            [
                CustomButton.state.init(color: UIColor.yellowColor(), titleText: "State one for button two."),
                CustomButton.state.init(color: UIColor.blueColor(), titleText: "State two for button."),
                CustomButton.state.init(color: UIColor.brownColor(), titleText: "State three."),
                CustomButton.state.init(color: UIColor.greenColor(), titleText: "Four!")
            ]
        )
        
        buttonTwo.translatesAutoresizingMaskIntoConstraints = false
        buttonTwo.stateWillChangeEvent = {() -> Void in
            print("Custom action before state change!")
        }
        self.view.addSubview(buttonTwo)
        
        self.view.addConstraints([
            NSLayoutConstraint.init(
                item: buttonTwo,
                attribute: NSLayoutAttribute.CenterX,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.view,
                attribute: NSLayoutAttribute.CenterX,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: buttonTwo,
                attribute: NSLayoutAttribute.CenterY,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.view,
                attribute: NSLayoutAttribute.CenterY,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: buttonTwo,
                attribute: NSLayoutAttribute.Width,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.view,
                attribute: NSLayoutAttribute.Width,
                multiplier: 0.7,
                constant: 0),
            NSLayoutConstraint.init(
                item: buttonTwo,
                attribute: NSLayoutAttribute.Height,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.view,
                attribute: NSLayoutAttribute.Height,
                multiplier: 0.1,
                constant: 0),
            ]
        )
        
        let buttonForecast = CustomButton.init(states:
            [
                CustomButton.state.init(color: UIColor.purpleColor(), titleText: "Open Forecast")
            ]
        )
        
        buttonForecast.translatesAutoresizingMaskIntoConstraints = false
        buttonForecast.stateDidChangeEvent = {() -> Void in
            self.presentViewController(ForecastViewController(), animated: true, completion: nil)
        }
        self.view.addSubview(buttonForecast)
        
        self.view.addConstraints([
            NSLayoutConstraint.init(
                item: buttonForecast,
                attribute: NSLayoutAttribute.CenterX,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.view,
                attribute: NSLayoutAttribute.CenterX,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: buttonForecast,
                attribute: NSLayoutAttribute.CenterY,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.view,
                attribute: NSLayoutAttribute.CenterY,
                multiplier: 1.5,
                constant: 0),
            NSLayoutConstraint.init(
                item: buttonForecast,
                attribute: NSLayoutAttribute.Width,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.view,
                attribute: NSLayoutAttribute.Width,
                multiplier: 0.7,
                constant: 0),
            NSLayoutConstraint.init(
                item: buttonForecast,
                attribute: NSLayoutAttribute.Height,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.view,
                attribute: NSLayoutAttribute.Height,
                multiplier: 0.1,
                constant: 0),
            ]
        )
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
