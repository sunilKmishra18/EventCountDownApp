//
//  UIImages+Extensions.swift
//  EventCountDownApp
//
//  Created by Sunil Mishra on 10/10/22.
//

import UIKit

extension UIImage {
    func sameAspectRatio(newHeight: CGFloat) -> UIImage {
        let scale = newHeight / size.height
        let newWidth = size.width * scale
        let newSize = CGSize(width: newWidth, height: newHeight)
        return UIGraphicsImageRenderer(size: newSize).image { _ in
            self.draw(in: .init(origin: .zero, size: newSize))
            
        }
        
    }
}
