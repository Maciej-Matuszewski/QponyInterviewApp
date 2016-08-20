//
//  WeatherCollectionViewCell.swift
//  QponyInterviewApp
//
//  Created by Maciej Matuszewski on 19.08.2016.
//  Copyright © 2016 Maciej Matuszewski. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView.init()
    let dateLabel = UILabel.init()
    let minTempLabel = CustomLabel.init(sublabelText: "min".localized, separatorLeft: false, separatorRight: true)
    let maxTempLabel = CustomLabel.init(sublabelText: "max".localized, separatorLeft: false, separatorRight: false)
    let mornTempLabel = CustomLabel.init(sublabelText: "morning".localized, separatorLeft: false, separatorRight: true)
    let dayTempLabel = CustomLabel.init(sublabelText: "day".localized, separatorLeft: false, separatorRight: true)
    let eveTempLabel = CustomLabel.init(sublabelText: "evening".localized, separatorLeft: false, separatorRight: true)
    let nightTempLabel = CustomLabel.init(sublabelText: "night".localized, separatorLeft: false, separatorRight: false)
    let pressureLabel = CustomLabel.init(sublabelText: "pressure".localized, separatorLeft: false, separatorRight: false)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clearColor()
        
        let contentView = UIView.init()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = Constants.kColorCellBackground
        contentView.layer.cornerRadius = 10
        self.addSubview(contentView)
        
        self.addConstraints([
            NSLayoutConstraint.init(
                item: contentView,
                attribute: NSLayoutAttribute.Left,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self,
                attribute: NSLayoutAttribute.Left,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: contentView,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1.0,
                constant: 50),
            NSLayoutConstraint.init(
                item: contentView,
                attribute: NSLayoutAttribute.Right,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self,
                attribute: NSLayoutAttribute.Right,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: contentView,
                attribute: NSLayoutAttribute.Bottom,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self,
                attribute: NSLayoutAttribute.Bottom,
                multiplier: 1.0,
                constant: 0),
            ])
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.contentMode = .ScaleAspectFit
        contentView.addSubview(self.imageView)
        
        self.addConstraints([
            NSLayoutConstraint.init(
                item: self.imageView,
                attribute: NSLayoutAttribute.Right,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.Right,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.imageView,
                attribute: NSLayoutAttribute.CenterY,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1.0,
                constant: 8),
            NSLayoutConstraint.init(
                item: self.imageView,
                attribute: NSLayoutAttribute.Width,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.Width,
                multiplier: 0.3,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.imageView,
                attribute: NSLayoutAttribute.Height,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.imageView,
                attribute: NSLayoutAttribute.Width,
                multiplier: 1.0,
                constant: 0),
            ])
        
        self.dateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.dateLabel.textColor = Constants.kColorLightFont
        self.dateLabel.font = Constants.kFontHeader
        self.dateLabel.textAlignment = .Left
        self.dateLabel.adjustsFontSizeToFitWidth = true
        contentView.addSubview(self.dateLabel)
        
        contentView.addConstraints([
            NSLayoutConstraint.init(
                item: self.dateLabel,
                attribute: NSLayoutAttribute.Left,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.Left,
                multiplier: 1.0,
                constant: 14),
            NSLayoutConstraint.init(
                item: self.dateLabel,
                attribute: NSLayoutAttribute.Right,
                relatedBy: NSLayoutRelation.LessThanOrEqual,
                toItem: self.imageView,
                attribute: NSLayoutAttribute.Left,
                multiplier: 1.0,
                constant: -8),
            NSLayoutConstraint.init(
                item: self.dateLabel,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1.0,
                constant: 4)
            ])
        
        self.mornTempLabel.font = Constants.kFontNormal
        contentView.addSubview(self.mornTempLabel)
        contentView.addConstraints([
            NSLayoutConstraint.init(
                item: self.mornTempLabel,
                attribute: NSLayoutAttribute.Left,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.Left,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.mornTempLabel,
                attribute: NSLayoutAttribute.Width,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.Width,
                multiplier: 0.25,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.mornTempLabel,
                attribute: NSLayoutAttribute.CenterY,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.CenterY,
                multiplier: 1.0,
                constant: 18),
            NSLayoutConstraint.init(
                item: self.mornTempLabel,
                attribute: NSLayoutAttribute.Height,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.Height,
                multiplier: 0.15,
                constant: 0),
            ])
        
        self.dayTempLabel.font = Constants.kFontNormal
        contentView.addSubview(self.dayTempLabel)
        contentView.addConstraints([
            NSLayoutConstraint.init(
                item: self.dayTempLabel,
                attribute: NSLayoutAttribute.Right,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.CenterX,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.dayTempLabel,
                attribute: NSLayoutAttribute.Width,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.Width,
                multiplier: 0.25,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.dayTempLabel,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.mornTempLabel,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.dayTempLabel,
                attribute: NSLayoutAttribute.Height,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.mornTempLabel,
                attribute: NSLayoutAttribute.Height,
                multiplier: 1.0,
                constant: 0),
            ])
        
        self.eveTempLabel.font = Constants.kFontNormal
        contentView.addSubview(self.eveTempLabel)
        contentView.addConstraints([
            NSLayoutConstraint.init(
                item: self.eveTempLabel,
                attribute: NSLayoutAttribute.Left,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.CenterX,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.eveTempLabel,
                attribute: NSLayoutAttribute.Width,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.Width,
                multiplier: 0.25,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.eveTempLabel,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.mornTempLabel,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.eveTempLabel,
                attribute: NSLayoutAttribute.Height,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.mornTempLabel,
                attribute: NSLayoutAttribute.Height,
                multiplier: 1.0,
                constant: 0),
            ])
        
        self.nightTempLabel.font = Constants.kFontNormal
        contentView.addSubview(self.nightTempLabel)
        contentView.addConstraints([
            NSLayoutConstraint.init(
                item: self.nightTempLabel,
                attribute: NSLayoutAttribute.Right,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.Right,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.nightTempLabel,
                attribute: NSLayoutAttribute.Width,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.Width,
                multiplier: 0.25,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.nightTempLabel,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.mornTempLabel,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.nightTempLabel,
                attribute: NSLayoutAttribute.Height,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.mornTempLabel,
                attribute: NSLayoutAttribute.Height,
                multiplier: 1.0,
                constant: 0),
            ])
        
        
        contentView.addSubview(self.minTempLabel)
        contentView.addConstraints([
            NSLayoutConstraint.init(
                item: self.minTempLabel,
                attribute: NSLayoutAttribute.Right,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.CenterX,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.minTempLabel,
                attribute: NSLayoutAttribute.Left,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.Left,
                multiplier: 1.0,
                constant: 14),
            NSLayoutConstraint.init(
                item: self.minTempLabel,
                attribute: NSLayoutAttribute.Bottom,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.mornTempLabel,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1.0,
                constant: -8),
            NSLayoutConstraint.init(
                item: self.minTempLabel,
                attribute: NSLayoutAttribute.Height,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.Height,
                multiplier: 0.25,
                constant: 0),
            ])
        
        contentView.addSubview(self.maxTempLabel)
        contentView.addConstraints([
            NSLayoutConstraint.init(
                item: self.maxTempLabel,
                attribute: NSLayoutAttribute.Left,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.CenterX,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.maxTempLabel,
                attribute: NSLayoutAttribute.Right,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.Right,
                multiplier: 1.0,
                constant: -14),
            NSLayoutConstraint.init(
                item: self.maxTempLabel,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.minTempLabel,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.maxTempLabel,
                attribute: NSLayoutAttribute.Height,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.minTempLabel,
                attribute: NSLayoutAttribute.Height,
                multiplier: 1.0,
                constant: 0),
            ])
        
        
        let tempTitleLabel = UILabel.init()
        tempTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tempTitleLabel.text = "Temperature".localized
        tempTitleLabel.textColor = Constants.kColorGrayFont
        tempTitleLabel.font = Constants.kFontSmall
        contentView.addSubview(tempTitleLabel)
        
        contentView.addConstraints([
            NSLayoutConstraint.init(
                item: tempTitleLabel,
                attribute: NSLayoutAttribute.Left,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.dateLabel,
                attribute: NSLayoutAttribute.Left,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: tempTitleLabel,
                attribute: NSLayoutAttribute.Bottom,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.minTempLabel,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1.0,
                constant: -8)
            ])
        
        let pressureTitleLabel = UILabel.init()
        pressureTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        pressureTitleLabel.text = "Pressure".localized
        pressureTitleLabel.textColor = Constants.kColorGrayFont
        pressureTitleLabel.font = Constants.kFontSmall
        contentView.addSubview(pressureTitleLabel)
        
        contentView.addConstraints([
            NSLayoutConstraint.init(
                item: pressureTitleLabel,
                attribute: NSLayoutAttribute.Left,
                relatedBy: NSLayoutRelation.Equal,
                toItem: tempTitleLabel,
                attribute: NSLayoutAttribute.Left,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: pressureTitleLabel,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.mornTempLabel,
                attribute: NSLayoutAttribute.Bottom,
                multiplier: 1.0,
                constant: 38)
            ])
        
        
        contentView.addSubview(self.pressureLabel)
        contentView.addConstraints([
            NSLayoutConstraint.init(
                item: self.pressureLabel,
                attribute: NSLayoutAttribute.CenterX,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.CenterX,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.pressureLabel,
                attribute: NSLayoutAttribute.Width,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.Width,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.pressureLabel,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: pressureTitleLabel,
                attribute: NSLayoutAttribute.Bottom,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.pressureLabel,
                attribute: NSLayoutAttribute.Height,
                relatedBy: NSLayoutRelation.Equal,
                toItem: contentView,
                attribute: NSLayoutAttribute.Height,
                multiplier: 0.2,
                constant: 0),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
