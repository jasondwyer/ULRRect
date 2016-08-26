//
//  ULRRectHelperTests.m
//  UltraLightRect
//
//  Created by Jason Dwyer on 5/5/16.
//  Copyright © 2016 Jason Dwyer. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ULRRectHelper.h"

@interface ULRRectHelper (test)

-(CGFloat)percentToLength:(double)percent ForWidth:(BOOL)forWidth;

@end

@interface ULRRectHelperTests : XCTestCase

@property (strong, nonatomic) ULRRectHelper *rectHelper;
@property double screenWidth;
@property double screenHeight;

@end

@implementation ULRRectHelperTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _rectHelper = [[ULRRectHelper alloc] init];
    _screenWidth = [UIScreen mainScreen].bounds.size.width;
    _screenHeight = [UIScreen mainScreen].bounds.size.height;

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testAdaptiveFont {
    
    NSUInteger testSize = [self.rectHelper adaptiveFontSized:12];
    if ([self.rectHelper isPhone]) {
        XCTAssertEqual(testSize, 12, @"The font conversion failed for the iPhone");
    }
    else {
        XCTAssertEqual(testSize, 21, @"The font conversion failed for iPad");
    }
}

- (void)testPercentConversion {
    
    CGFloat testFloat1 = [self.rectHelper percentToLength:31.1 ForWidth:YES];
    CGFloat testFloat2 = [self.rectHelper percentToLength:18.7 ForWidth:NO];
    
    CGFloat expectedFloat1 = _screenWidth * (31.1 / 100.0);
    CGFloat expectedFloat2 = _screenHeight * (18.7 / 100.0);
    
    XCTAssertEqual(testFloat1, expectedFloat1, @"The width percent conversion failed");
    XCTAssertEqual(testFloat2, expectedFloat2, @"The height percent conversion failed");
}

-(void)testQuickFrameWithXPoint {
    
    CGRect testRectangle = [self.rectHelper quickFrameWithXPoint:13.5 YPoint:16.0 Width:82.0 Height:86.0];
    
    CGRect expectedRectangle = CGRectMake(_screenWidth * (13.5/ 100.0), _screenHeight * (16.0 / 100.0), _screenWidth * (82.0 / 100.0), _screenHeight * (86.0 / 100.0));
    
    XCTAssertEqual(testRectangle.size.width, expectedRectangle.size.width, @"The quick frame width test failed");
    XCTAssertEqual(testRectangle.size.height, expectedRectangle.size.height, @"The quick frame height test failed");
}


-(void)testSquareFrame {
    
    CGRect squareRect = [self.rectHelper squareFrameWithXPoint:31.1 YPoint:18.7 sideLengthAsPercentOfWidth:50.1];
    
    CGRect expectedSquare = CGRectMake(_screenWidth * (31.1 / 100.0), _screenHeight * (18.7 / 100.0), _screenWidth * (50.1 / 100.0), _screenWidth * (50.1 / 100.0));
    XCTAssertEqual(squareRect.size.width, expectedSquare.size.width, @"The square frame width test failed");
    XCTAssertEqual(squareRect.size.height, expectedSquare.size.height, @"The square frame height test failed");
    
}


@end
