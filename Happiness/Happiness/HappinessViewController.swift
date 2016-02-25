//
//  HappinessViewController.swift
//  Happiness
//
//  Created by 杨晓冬 on 16/2/11.
//  Copyright © 2016年 杨晓冬. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource {
    
    private struct Constants {
        static let HappinessGestureScale: CGFloat = 4
    }
    // MARK - IBOutlet
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
        }
    }
    
    // MARK - IBAction
    
    @IBAction func changeHappiness(sender: UIPanGestureRecognizer) {
        switch(sender.state) {
        case .Ended: fallthrough
        case .Changed:
            let tranlation = sender.translationInView(faceView)
            let happinessChange = -Int(tranlation.y / Constants.HappinessGestureScale)
            if(happinessChange != 0) {
                happiness += happinessChange
            }
        default: break
        }
    }
    
    // MARK - Variable
    var happiness: Int = 75 {
        didSet {
            happiness = min(max(happiness, 0),100)
            print("happiness = \(happiness)")
            updateUI()
        }
    }
    
    // MARK - Method
    
    private func updateUI() {
        faceView.setNeedsDisplay()
    }
    
    // MARK - Data Source
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness - 50) / 50
    }
}
