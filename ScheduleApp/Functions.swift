//
//  Functions.swift
//  ScheduleApp
//
//  Created by Андрей Ефимов on 01.12.2022.
//

import Foundation
import SwiftUI


// Get screen size
extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}


// line shape
struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint.zero)
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY), control: CGPoint(x: rect.midX, y: rect.minY + 70))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY), control: CGPoint(x: rect.midX, y: rect.maxY + 70))
        path.closeSubpath()
        
        return path
    }
}


// True if a String is Int
extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}
