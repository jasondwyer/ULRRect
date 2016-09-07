//
//  ViewController.m
//  UltraLightRect
//
//  Created by Jason Dwyer on 5/3/16.
//  Copyright © 2016 Jason Dwyer. All rights reserved.
//
//  MIT Licensed. Use however you see fit.

/*The below code demonstrates examples for creating UIViews programmatically and setting their frame using the UltraLightRect helpers for both Objective-C and Swift. Also demonstrated are the adaptive font and device helper methods.*/

#import "ViewController.h"
#import "ULRRectHelper.h"
#import "UltraLightRect-Swift.h"

@interface ViewController ()

//using objective c ULRRectHelper
@property (strong, nonatomic) ULRRectHelper *rectHelper;

//using Swift ULRRectSwiftHelper
@property (strong, nonatomic) ULRRectSwiftHelper *swiftHelper;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //initialize Objective-C ULRRectHelper
    _rectHelper = [[ULRRectHelper alloc] init];
    
    //inititalize Swift ULRRectSwiftHelper
    _swiftHelper = [[ULRRectSwiftHelper alloc] init];
    
    //call methods to build the UIViews
    [self buildSquareView];
    [self buildSquareViewWithSwiftHelper];
    [self buildRectangleView];
    [self buildRectangleViewWithSwiftHelper];
    
    //create a UILabel to display the device (iPhone or iPad)
    [self buildDeviceLabel];
}

//use ULRRectHelper to create a square UIView
-(void)buildSquareView {
    
    UIView *sqaureView = [[UIView alloc] initWithFrame:[self.rectHelper squareFrameWithXPoint:31.1 YPoint:18.7 sideLengthAsPercentOfWidth:50.1]];
    sqaureView.backgroundColor = [UIColor blueColor];
    [sqaureView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [self.view addSubview:sqaureView];
}

//use ULRRectSwiftHelper to build a square UILabel - demonstrates how to use ULRRectSwiftHelper in obj c
-(void)buildSquareViewWithSwiftHelper {
    
    UILabel *redSquare = [[UILabel alloc] initWithFrame:[self.swiftHelper squareFrameWithXPoint:37.0 YPoint:28.0 sideLengthAsPercentOfWidth:40.0]];
    redSquare.backgroundColor = [UIColor redColor];
    redSquare.text = @"Made with Swift Helper";
    redSquare.font = [UIFont systemFontOfSize:[self.rectHelper adaptiveFontSized:10]];
    redSquare.textColor = [UIColor whiteColor];
    redSquare.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:redSquare];
}

//use ULRRectHelper to create a rectangular UIView
-(void)buildRectangleView {
    
    UIView *rectangleView = [[UIView alloc] initWithFrame:[self.rectHelper quickFrameWithXPoint:29.0 YPoint:68.0 Width:60.0 Height:10.0]];
    rectangleView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:rectangleView];
}

//use ULRRectSwiftHelper to build a rectangular UILabel
-(void)buildRectangleViewWithSwiftHelper {
    
    UILabel *greenView = [[UILabel alloc] initWithFrame:[self.swiftHelper quickFrameWithXPoint:20.0 YPoint:63.0 Width:60.0 Height:10.0]];
    greenView.backgroundColor = [UIColor purpleColor];
    greenView.text = @"Made with Swift Helper";
    greenView.font = [UIFont systemFontOfSize:[self.rectHelper adaptiveFontSized:10]];
    greenView.textColor = [UIColor whiteColor];
    greenView.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:greenView];
}

-(void)buildDeviceLabel {
    
    UILabel *deviceLabel = [[UILabel alloc] initWithFrame:[self.rectHelper quickFrameWithXPoint:9.0 YPoint:7.2 Width:70.0 Height:6.0]];
    deviceLabel.backgroundColor = [UIColor redColor];
    deviceLabel.font = [UIFont systemFontOfSize:[self.swiftHelper adaptiveFontSized:32]];
    deviceLabel.textColor = [UIColor whiteColor];
    deviceLabel.textAlignment = NSTextAlignmentCenter;
    if ([self.rectHelper isPhone]) {
        deviceLabel.text = @"Device: iPhone";
    }
    else {
        deviceLabel.text = @"Device: iPad";
    }
    [self.view addSubview:deviceLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
