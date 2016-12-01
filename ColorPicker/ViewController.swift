//
//  ViewController.swift
//  ColorPicker
//
//  Created by iem on 01/12/2016.
//  Copyright © 2016 iem. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ColorPickerDelegate {

    @IBOutlet var firstView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    internal func userDidChooseColor(color: UIColor){
        let oldColor : UIColor = firstView.backgroundColor!
        self.firstView.backgroundColor = color
        dismiss(animated: true, completion: nil)
       
        let alert = UIAlertController(title: "Information", message: "Voulez vous garder cette couleur de fond?", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Oui", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Non", style: UIAlertActionStyle.cancel, handler:{ action in self.firstView.backgroundColor = oldColor}))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PickColor" {
            let destination = segue.destination as! ColorPickerViewController
            destination.delegate = self
        }
    }
}

