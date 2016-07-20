//
//  Globals.swift
//  HuaXiFollowUp
//
//  Created by user on 16/4/7.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class Globals: NSObject {
    
    
    
    class func RGB(red:CGFloat,green:CGFloat,blue:CGFloat)->UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1)
    }
    
    class func SCREEN_WIDTH()->CGFloat{
        return UIScreen.mainScreen().bounds.size.width
    }
    
    class func SCREEN_HEIGHT()->CGFloat{
        return UIScreen.mainScreen().bounds.size.height
    }
    
    class func TEXTFIELD_HEIGHT()->CGFloat {
        return 45
    }
    
    class func HOMEPAGE_CELL_HEIGHT()->CGFloat {
        return 70
    }
    
    class func INFORBOARDLIST_CELL_HEIGHT()->CGFloat {
        return 80
    }
    
    class func PROCUREMENTAUDI_CELL_HEIGHT()->CGFloat {
        return 90
    }
    
    class func SUPPLIERMANAGEMENT_CELL_HEIGHT()->CGFloat {
        return 120
    }
    
    class func RandomColor()->UIColor {

        let redColor:CGFloat=CGFloat(CGFloat(random())%CGFloat(256))
        let greenColor:CGFloat=CGFloat(CGFloat(random())%CGFloat(256))
        let blueColor:CGFloat=CGFloat(CGFloat(random())%CGFloat(256))
        
        return UIColor(red: redColor/255.0, green: greenColor/255.0, blue: blueColor/255.0, alpha: 1)
        
    }
    
    class func blueColor()->UIColor {
        return UIColor(red: 0x3e/255.0, green: 0xa1/255.0, blue: 0xc7/255.0, alpha: 1.0)
    }
    
    class func grayColor()->UIColor {
        return UIColor(red: 0xf3/255.0, green: 0xf3/255.0, blue: 0xf3/255.0, alpha: 1.0)
    }

    class func greenColor()->UIColor {
        return UIColor(red: 0x1f/255.0, green: 0xbf/255.0, blue: 0x63/255.0, alpha: 1.0)
    }
    
    class func redColor()->UIColor {
        return UIColor(red: 0xfc/255.0, green: 0x59/255.0, blue: 0x5d/255.0, alpha: 1.0)
    }
    
    
    class func cutImage(image:UIImage, size:CGSize)->UIImage{
        
        var newSize:CGSize=CGSizeMake(0, 0)
        var imageRef:CGImageRef
        
        if (image.size.width/image.size.height)<(size.width/size.height) {
            newSize.width=image.size.width
            newSize.height=image.size.width*size.height/size.width
            imageRef=CGImageCreateWithImageInRect(image.CGImage, CGRectMake(0, fabs(image.size.height-newSize.height)/2, newSize.width, newSize.height))!
        }else{
            newSize.height=image.size.height
            newSize.width=image.size.height*size.width/size.height
            imageRef=CGImageCreateWithImageInRect(image.CGImage, CGRectMake(fabs(image.size.width-newSize.width)/2, 0, newSize.width, newSize.height))!
        }
        return UIImage(CGImage: imageRef)
    }
    
    
    
}
