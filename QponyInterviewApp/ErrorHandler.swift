//
//  ErrorHandler.swift
//  QponyInterviewApp
//
//  Created by Maciej Matuszewski on 19.08.2016.
//  Copyright © 2016 Maciej Matuszewski. All rights reserved.
//

import Foundation
import UIKit

func handleError(code: Int, completion: (errorMessage: String) -> Void) {
	
	switch code {
	default:
		completion(errorMessage: "Something went wrong! Please try again.".localized)
		break
	}
	
}

func handleAlertWithMessage(viewController: UIViewController, message: String) {
	
	let alert = UIAlertController(title: "Error".localized, message: message, preferredStyle: .Alert)
	alert.addAction(UIAlertAction(title: "Ok".localized, style: .Cancel, handler:nil))
	viewController.presentViewController(alert, animated: true, completion: nil)
}