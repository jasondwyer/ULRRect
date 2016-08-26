//
//  ULRRectHelper.h
//  UltraLightRect
//
//  Created by Jason Dwyer on 5/3/16.
//  Copyright © 2016 Jason Dwyer. All rights reserved.
//
//  MIT Licensed. Use however you see fit.

/* ULRRect provides light-weight classes for Cocoa Touch to help build UIViews and other elements requiring CGRects programmatically. With a few basic methods, an instance of ULRRectHelper can easily provide CGRects for view frames based on simple percents of the screen size. It also helps to format view size and position on both iPhone and iPad, which have different screen sizes. Helper methods quickly determine if the device is an iPhone or iPad and create adaptive font sizing that scales for different size devices. Note: Considerations need to be taken when building an app that allows rotation to different orientations.
    
    ***For full docs visit http://jasondwyer.github.io/ULRRect***
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ULRRectHelper : NSObject

-(BOOL)isPhone;
-(NSUInteger)adaptiveFontSized:(NSUInteger)size;
-(CGRect)quickFrameWithXPoint:(double)xPoint YPoint:(double)yPoint Width:(double)width Height:(double)height;
-(CGRect)squareFrameWithXPoint:(double)xPoint YPoint:(double)yPoint sideLengthAsPercentOfWidth:(double)side;

@end
