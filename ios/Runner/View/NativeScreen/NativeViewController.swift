//
//  NativeViewController.swift
//  Runner
//
//  Created by Turan Aktaş on 15.11.2023.
//

import Foundation
import UIKit


class NativeViewController: UIViewController {
    
    @IBAction func backToFlutter () {
        print("BACK TO FLUTTER BUTTON CLICKED")
        if let appDelegate : AppDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.backToFlutter()
        }
    }
    
}
