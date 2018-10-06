//
//  QuesoView.swift
//  Examen
//
//  Created by Fernando on 06/10/2018.
//  Copyright © 2018 UPM. All rights reserved.
//

import UIKit

protocol QuesoViewDataSource: class { //class se pone porque hemos definido el datasource con weak
    
    func initialAngleForQuesoView(_ qv: QuesoView) -> Double
    func finalAngleForQuesoView(_ qv: QuesoView) -> Double
    
}

@IBDesignable 
class QuesoView: UIView {
    
    weak var datasource: QuesoViewDataSource!

    //var a0: Double = 0.0  //Con el datasource las variables, no las queremos
    //var a1: Double = Double.pi
    
    override func draw(_ rect: CGRect) {
        
        let w = bounds.size.width
        let h = bounds.size.height
        let c = CGPoint(x: w/2, y: h/2)
        let r = min(w, h)/2
        
        let path = UIBezierPath()
        
        path.move(to: c)
        path.addArc(withCenter: c,
                    radius: r,
                    startAngle: CGFloat(datasource.initialAngleForQuesoView(self)), //en vez de a0, a1, tenemos que preguntar al datasource
                    endAngle: CGFloat(datasource.finalAngleForQuesoView(self)),
                    clockwise: false)
        path.close()
        
        
        UIColor.red.setFill()
        path.fill()
        UIColor.blue.setStroke()
        path.stroke()
        
    }
    

}
