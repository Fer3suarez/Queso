//
//  ViewController.swift
//  Examen
//
//  Created by Fernando on 06/10/2018.
//  Copyright © 2018 UPM. All rights reserved.
//

import UIKit

class ViewController: UIViewController, QuesoViewDataSource { //hay que implementar el datasource que hemos creado

    @IBOutlet weak var queso1View: QuesoView!
    @IBOutlet weak var queso2View: QuesoView!
    
    @IBOutlet weak var slider: UISlider!
    
    private var sliderValue: Double = 0 {
        didSet {
            queso1View.setNeedsDisplay()
            queso2View.setNeedsDisplay()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //queso1View.a0 = 0
        //queso2View.a1 = 2 * Double.pi
        
        queso1View.datasource = self
        queso2View.datasource = self
        
        slider.sendActions(for: .valueChanged)
        
    }


    @IBAction func updateQuesos(_ sender: UISlider) {
        
        //let v = Double(sender.value)
        sliderValue = Double(sender.value)
        
        //queso1View.a1 = v * 2 * Double.pi
        //queso2View.a0 = v * 2 * Double.pi
        
        //queso1View.setNeedsDisplay() //no hace falta llamar a pintar, porque hemos indicado en nuestra variable privada que cuando el slider cambie, se pinte
        //queso2View.setNeedsDisplay()
        
    }
    
    
    func initialAngleForQuesoView(_ qv: QuesoView) -> Double { //funciones del datasource
        
        switch qv {
        case queso1View:
            return 0
        case queso2View:
            let v = sliderValue * 2 * Double.pi
            return v
        default:
            return 0
        }
        
    }
    
    func finalAngleForQuesoView(_ qv: QuesoView) -> Double {
        
        switch qv {
        case queso1View:
            let v = sliderValue * 2 * Double.pi
            return v
        case queso2View:
            return 2 * Double.pi
        default:
            return 0
        }
        
    }

}

