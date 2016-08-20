//
//  WeatherViewController.swift
//  QponyInterviewApp
//
//  Created by Maciej Matuszewski on 19.08.2016.
//  Copyright © 2016 Maciej Matuszewski. All rights reserved.
//

import UIKit
import SDWebImage
import KVNProgress

class WeatherViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var daysArray : [DayResultModel] = []

    let cityNameLabel = UILabel.init()
    var collectionView : UICollectionView!

    //MARK:- Layout
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Constants.kColorBackground
        
        self.cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.cityNameLabel.textColor = Constants.kColorLightFont
        self.cityNameLabel.font = Constants.kFontHeader
        self.cityNameLabel.textAlignment = .Center
        self.view.addSubview(self.cityNameLabel)
        
        self.view.addConstraints([
            NSLayoutConstraint.init(
                item: self.cityNameLabel,
                attribute: NSLayoutAttribute.CenterX,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.view,
                attribute: NSLayoutAttribute.CenterX,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.cityNameLabel,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.view,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1.0,
                constant: 30),
            NSLayoutConstraint.init(
                item: self.cityNameLabel,
                attribute: NSLayoutAttribute.Height,
                relatedBy: NSLayoutRelation.Equal,
                toItem: nil,
                attribute: NSLayoutAttribute.Height,
                multiplier: 1.0,
                constant: 30),
            ])
        
        let collectionViewLayout = UICollectionViewFlowLayout.init()
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        collectionViewLayout.scrollDirection = .Horizontal
        
        self.collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: collectionViewLayout)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.pagingEnabled = true
        self.collectionView.backgroundColor = UIColor.clearColor()
        self.collectionView.registerClass(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        self.view.addSubview(self.collectionView)
        
        self.view.addConstraints([
            NSLayoutConstraint.init(
                item: self.collectionView,
                attribute: NSLayoutAttribute.Left,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.view,
                attribute: NSLayoutAttribute.Left,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.collectionView,
                attribute: NSLayoutAttribute.Right,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.view,
                attribute: NSLayoutAttribute.Right,
                multiplier: 1.0,
                constant: 0),
            NSLayoutConstraint.init(
                item: self.collectionView,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.cityNameLabel,
                attribute: NSLayoutAttribute.Bottom,
                multiplier: 1.0,
                constant: -20),
            NSLayoutConstraint.init(
                item: self.collectionView,
                attribute: NSLayoutAttribute.Bottom,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.view,
                attribute: NSLayoutAttribute.Bottom,
                multiplier: 1.0,
                constant: 0),
            ])
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.fetchData()
    }
    
    //MARK:- Load data
    
    func fetchData(){
        
        KVNProgress.showWithStatus("Please wait".localized)
        
        Network
            .ForecastDaily(city: Constants.kCityName, units: Units.metric, days: 7)
            .URLRequest
            .responseObject {(response: ResponseModel?, error) in
                
                if response != nil{
                    guard
                        let cityName = response?.city?.name,
                        let days = response?.days
                        else{
                            KVNProgress.showError()
                            print("Data is missing!")
                            return
                    }
                    self.cityNameLabel.text = cityName
                    self.daysArray = days
                    self.collectionView.reloadData()
                    KVNProgress.showSuccess()
                    self.performSelector(#selector(self.fetchData), withObject: nil, afterDelay: 600)
                }else{
                    KVNProgress.showError()
                    self.performSelector(#selector(self.fetchData), withObject: nil, afterDelay: 15)
                }
            }
    }
    
    //MARK:- Collection View
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return daysArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! WeatherCollectionViewCell
        
        guard
        let image = daysArray[indexPath.row].weather?.first?.icon,
        let dt = daysArray[indexPath.row].dt,
        let minTemp = daysArray[indexPath.row].temperature?.min,
        let maxTemp = daysArray[indexPath.row].temperature?.max,
        let mornTemp = daysArray[indexPath.row].temperature?.morn,
        let dayTemp = daysArray[indexPath.row].temperature?.day,
        let eveTemp = daysArray[indexPath.row].temperature?.eve,
        let nightTemp = daysArray[indexPath.row].temperature?.night,
        let pressure = daysArray[indexPath.row].pressure
            else{
                return cell
        }
        
        cell.imageView.sd_setImageWithURL(NSURL.init(string: "http://openweathermap.org/img/w/\(image).png"))
        cell.dateLabel.text = NSDate.init(timeIntervalSince1970: dt).dateName()
        cell.minTempLabel.text = minTemp.description + "°C"
        cell.maxTempLabel.text = maxTemp.description + "°C"
        cell.mornTempLabel.text = mornTemp.description + "°C"
        cell.dayTempLabel.text = dayTemp.description + "°C"
        cell.eveTempLabel.text = eveTemp.description + "°C"
        cell.nightTempLabel.text = nightTemp.description + "°C"
        cell.pressureLabel.text = pressure.description + " hPa"
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize.init(width: collectionView.bounds.width - 10, height: collectionView.bounds.height - 10)
    }
    
    
}
