//
//  Globals.swift
//  HuaXiFollowUp
//
//  Created by user on 16/4/7.
//  Copyright © 2016年 Apple0611. All rights reserved.
//

import UIKit

class Globals: NSObject {
    
    
    enum TreatmentCategory : Int{
        case KIDNEY_STONE            //肾结石
        case URETHRAL_STRICTURE        //尿道狭窄
        case HYPOSPADIAS               //尿道下裂
        case UPJO                      //UPJO
        case OTHER                     //其他
    }
    
    
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
    
    class func TREATMENT_DETAIL_CELL_HEIGHT()->CGFloat {
        return 44
    }
    
    class func RandomColor()->UIColor {

        let redColor:CGFloat=CGFloat(CGFloat(random())%CGFloat(256))
        let greenColor:CGFloat=CGFloat(CGFloat(random())%CGFloat(256))
        let blueColor:CGFloat=CGFloat(CGFloat(random())%CGFloat(256))
        
        return UIColor(red: redColor/255.0, green: greenColor/255.0, blue: blueColor/255.0, alpha: 1)
        
    }
    
    class func SepLineColor()->UIColor {
        return UIColor(red: 243/255.0, green: 243/255.0, blue: 243/255.0, alpha: 1.0)
    }
    
    class func TextColor()->UIColor {
        return UIColor(red: 96/255.0, green: 96/255.0, blue: 96/255.0, alpha: 1.0)
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
