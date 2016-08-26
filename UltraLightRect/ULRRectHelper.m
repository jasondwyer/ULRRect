//
//  ULRRectHelper.m
//  UltraLightRect
//
//  Created by Jason Dwyer on 5/3/16.
//  Copyright © 2016 Jason Dwyer. All rights reserved.
//
//  MIT Licensed. Use however you see fit.

#import "ULRRectHelper.h"

@implementation ULRRectHelper

-(instancetype)init {
    self = [super init];
    
    if (self) {
        //setup
    }
    
    return self;
}

#pragma mark - General Helper Methods

//returns a BOOL based on whether the device is an iPhone or not
-(BOOL)isPhone {
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        return YES;
    }
    else {
        return NO;
    }
}

//returns a font size scaled up by 1.8 if the device is an iPad
//This is useful for setting font sizes to be 'similar' (not identical) on universal apps
-(NSUInteger)adaptiveFontSized:(NSUInteger)size {
    if ([self isPhone]) {
        return size;
    }
    else {
        return size * 1.8;
    }
}

#pragma mark - Rect Helpers

//convert percent values to length based on screen size
-(CGFloat)percentToLength:(double)percent ForWidth:(BOOL)forWidth {
    
    if (forWidth) {
        CGFloat length = [UIScreen mainScreen].bounds.size.width * (percent / 100.0);
        return length;
    }
    else {
        CGFloat length = [UIScreen mainScreen].bounds.size.height * (percent / 100.0);
        return length;
    }
}

-(CGRect)quickFrameWithXPoint:(double)xPoint YPoint:(double)yPoint Width:(double)width Height:(double)height {
    
    CGRect returnFrame = CGRectMake([self percentToLength:xPoint ForWidth:YES], [self percentToLength:yPoint ForWidth:NO], [self percentToLength:width ForWidth:YES], [self percentToLength:height ForWidth:NO]);
    return returnFrame;
}

-(CGRect)squareFrameWithXPoint:(double)xPoint YPoint:(double)yPoint sideLengthAsPercentOfWidth:(double)side {
    
    CGRect returnFrame = CGRectMake([self percentToLength:xPoint ForWidth:YES], [self percentToLength:yPoint ForWidth:NO], [self percentToLength:side ForWidth:YES], [self percentToLength:side ForWidth:YES]);
    
    return returnFrame;
}

@end
