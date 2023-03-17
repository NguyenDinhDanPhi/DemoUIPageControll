//
//  CustomPageControl.swift
//  DemoUIPageControl
//
//  Created by dan phi on 14/03/2023.
//

import UIKit
class CustomPageControl: UIPageControl {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size: CGFloat = 12 // The size of the UIView
        let spacing: CGFloat = 8 // The spacing between the UIViews
        
        for (index, dot) in subviews.enumerated() {
            dot.frame.size = CGSize(width: size, height: size)
            dot.layer.cornerRadius = size / 2
            dot.backgroundColor = index == currentPage ? UIColor.blue : UIColor.lightGray // Set the background color
            dot.frame.origin.x = CGFloat(index) * (size + spacing)
        }
    }

}
