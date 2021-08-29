//
//  UIVIew.swift
//  AvitoTest
//
//  Created by Andrey on 29.08.2021.
//

import UIKit

extension UIView {
    
    func constraint(top: NSLayoutYAxisAnchor?, _ value: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top { topAnchor.constraint(equalTo: top, constant: value).isActive = true }
    }
    
    func constraint(bottom: NSLayoutYAxisAnchor?, _ value: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let bottom = bottom { bottomAnchor.constraint(equalTo: bottom, constant: -value).isActive = true }
    }
    
    func constraint(left: NSLayoutXAxisAnchor?, _ value: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let left = left { leftAnchor.constraint(equalTo: left, constant: value).isActive = true }
    }
    
    func constraint(right: NSLayoutXAxisAnchor?, _ value: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let right = right { rightAnchor.constraint(equalTo: right, constant: -value).isActive = true }
    }
    
    func constraint(leading: NSLayoutXAxisAnchor?, _ value: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let leading = leading { leadingAnchor.constraint(equalTo: leading, constant: value).isActive = true }
    }
    
    func constraint(trailing: NSLayoutXAxisAnchor?, _ value: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let trailing = trailing { trailingAnchor.constraint(equalTo: trailing, constant: -value).isActive = true }
    }
    
    func constraint(width: CGFloat?) {
        translatesAutoresizingMaskIntoConstraints = false
        if let width = width { widthAnchor.constraint(equalToConstant: width).isActive = true }
    }
    
    func constraint(height: CGFloat?) {
        translatesAutoresizingMaskIntoConstraints = false
        if let height = height { heightAnchor.constraint(equalToConstant: height).isActive = true }
    }
    
    func constraint(x: NSLayoutXAxisAnchor?, _ value: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let x = x { centerXAnchor.constraint(equalTo: x, constant: value).isActive = true }
    }
    
    func constraint(y: NSLayoutYAxisAnchor?, _ value: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let y = y { centerYAnchor.constraint(equalTo: y, constant: value).isActive = true }
    }
}
