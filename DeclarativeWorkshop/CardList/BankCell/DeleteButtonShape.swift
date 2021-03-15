//
//  DeleteButtonShape.swift
//  DeclarativeWorkshop
//
//  Created by andrey on 15.03.2021.
//

import SwiftUI

struct DeleteButtonShape: Shape {
    var radius: CGFloat = .infinity
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let w = rect.size.width
        let h = rect.size.height
        
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: w - radius, y: 0))
        path.addArc(center: CGPoint(x: w - radius, y: radius), radius: radius, startAngle: .degrees(-90), endAngle: .degrees(0), clockwise: false)
        path.addArc(center: CGPoint(x: w - radius, y: h - radius), radius: radius, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: false)
        path.addArc(center: CGPoint(x: 0, y: h - radius), radius: radius, startAngle: .degrees(90), endAngle: .degrees(0), clockwise: true)
        path.addArc(center: CGPoint(x: 0, y: radius), radius: radius, startAngle: .degrees(0), endAngle: .degrees(-90), clockwise: true)
        path.closeSubpath()
        return Path(path.cgPath)
    }
}
