//
//  ColorPickerViewController.swift
//  ColorPicker
//
//  Created by iem on 01/12/2016.
//  Copyright © 2016 iem. All rights reserved.
//

import UIKit

extension UIImage {
    func getPixelColor(pos: CGPoint) -> UIColor {
        
        let pixelData = self.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
        
        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }  
}

class ColorPickerViewController: UIViewController{
    
    var delegate : ColorPickerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func selectGreen(_ sender: UIButton) {
        delegate?.userDidChooseColor(color: Color.green)
    }
    
    @IBAction func selectOrange(_ sender: UIButton) {
        delegate?.userDidChooseColor(color: Color.orange)
    }
    
    @IBAction func selectBrown(_ sender: UIButton) {
        delegate?.userDidChooseColor(color: Color.brown)
    }
    
}

protocol ColorPickerDelegate {
    func userDidChooseColor(color: UIColor)
}

struct Color{
    static let green = #imageLiteral(resourceName: "green").getPixelColor(pos: CGPoint(x: 10 , y: 10))
    static let orange = #imageLiteral(resourceName: "orange").getPixelColor(pos: CGPoint(x: 10 , y: 10))
    static let brown = #imageLiteral(resourceName: "red").getPixelColor(pos: CGPoint(x: 10 , y: 10))
}
