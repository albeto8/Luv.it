//
//  Constants.swift
//  Luv it
//
//  Created by Mario Alberto Barragán Espinosa on 18/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import UIKit

let BASE_URL = "http://luvit-exam.dpabkxfpxz.us-west-2.elasticbeanstalk.com/ios_exam/"
let RED_COLOR = hexStringToUIColor(hex: "#D0011B")
let DARK_GRAY_COLOR = hexStringToUIColor(hex: "#4A4A4A")
let LIGHT_GRAY_COLOR = hexStringToUIColor(hex: "#9B9B9B")

func STRIKE_ATTRIBUTE(text: String) -> NSAttributedString{
    
    return NSAttributedString(string: text, attributes: [NSStrikethroughStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue])
}



typealias DownloadComplete = () -> ()


func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.characters.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
