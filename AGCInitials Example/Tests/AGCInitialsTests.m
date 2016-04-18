//
//  Created by Andrea Cipriani on 07/04/16.
//

#import "AGCInitialsColors.h"
#import "OCMock.h"
#import "UIImageView+AGCInitials.h"
#import "AGCInitialsForTesting.h"
#import <XCTest/XCTest.h>

#define IMAGE_VIEW_WIDTH 200
#define IMAGE_VIEW_HEIGHT 200

@interface AGCInitialsTests : XCTestCase

@property UIImageView* imageView;

@end

@implementation AGCInitialsTests

- (void)setUp
{
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, IMAGE_VIEW_WIDTH, IMAGE_VIEW_HEIGHT)];
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testImageWithACGInitialsExist
{
    [_imageView agc_setImageWithInitials:@"AC"];
    NSAssert(_imageView.image, @"Image is nil after setting with initials");
}

#pragma mark - Test initials from name

- (void)testImageWithInitialsFromName
{
    id imageViewMock = OCMPartialMock(_imageView);
    OCMExpect([imageViewMock agc_setImageWithInitials:@"AC" stringForColor:@"Andrea Cipriani" textAttributes:[OCMArg any]]);
    [imageViewMock agc_setImageWithInitialsFromName:@"Andrea Cipriani" separatedByString:@" "];
    OCMVerifyAll(imageViewMock);
}

- (void)testImageWithInitialsWithWrongSeparator
{
    id imageViewMock = OCMPartialMock(_imageView);
    OCMExpect([imageViewMock agc_setImageWithInitials:@"A" stringForColor:@"Andrea Cipriani" textAttributes:[OCMArg any]]);
    [imageViewMock agc_setImageWithInitialsFromName:@"Andrea Cipriani" separatedByString:@"*"];
    OCMVerifyAll(imageViewMock);
}

- (void)testInitialsForEmptyNameComponentsShouldBeEmpty
{
    id imageViewMock = OCMPartialMock(_imageView);
    OCMExpect([imageViewMock agc_setImageWithInitials:@"" stringForColor:@" " textAttributes:[OCMArg any]]);
    [imageViewMock agc_setImageWithInitialsFromName:@" " separatedByString:@" "];
    OCMVerifyAll(imageViewMock);
}

- (void)testInitialsForNameWithMoreThanTwoComponentsShouldUseFirstAndLastComponent
{
    id imageViewMock = OCMPartialMock(_imageView);
    OCMExpect([imageViewMock agc_setImageWithInitials:@"AC" stringForColor:@"Andrea Guido Cipriani" textAttributes:[OCMArg any]]);
    [imageViewMock agc_setImageWithInitialsFromName:@"Andrea Guido Cipriani" separatedByString:@" "];
    OCMVerifyAll(imageViewMock);
}

- (void)testInitialsForNameThatStartsWithSeparator
{
    id imageViewMock = OCMPartialMock(_imageView);
    OCMExpect([imageViewMock agc_setImageWithInitials:@"AC" stringForColor:@" Andrea Cipriani" textAttributes:[OCMArg any]]);
    [imageViewMock agc_setImageWithInitialsFromName:@" Andrea Cipriani" separatedByString:@" "];
    OCMVerifyAll(imageViewMock);
}

- (void)testInitialsForNameWithMoreThanOneConsecutiveSeparator
{
    id imageViewMock = OCMPartialMock(_imageView);
    OCMExpect([imageViewMock agc_setImageWithInitials:@"AC" stringForColor:@" Andrea    Cipriani   " textAttributes:[OCMArg any]]);
    [imageViewMock agc_setImageWithInitialsFromName:@" Andrea    Cipriani   " separatedByString:@" "];
    OCMVerifyAll(imageViewMock);
}

#pragma mark - Initials + Colors collaboration

-(void)testImageWithDifferentInitialsAndSameNameShouldNotAlwaysHaveSameColor
{
    [_imageView agc_setImageWithInitialsFromName:@"Andrea Cipriani" separatedByString:@" "];
    UIColor *color1 = _imageView.backgroundColor;
    [_imageView agc_setImageWithInitialsFromName:@"Another Cipriani" separatedByString:@" "];
    UIColor *color2 = _imageView.backgroundColor;
    [_imageView agc_setImageWithInitialsFromName:@"Also Cipriani" separatedByString:@" "];
    UIColor *color3 = _imageView.backgroundColor;
    [_imageView agc_setImageWithInitialsFromName:@"Aldo Cipriani" separatedByString:@" "];
    UIColor *color4 = _imageView.backgroundColor;
    BOOL differentColorsGenerated = (([color1 isEqual:color2] && [color2 isEqual:color3] && [color3 isEqual:color4]) == NO);
    NSAssert(differentColorsGenerated,@"Color for same initials but different names don't have to be equal!");
}

- (void)testImageWithInitialsCallsColorForStringWithExpectedArg
{
    id agcColorsMock = OCMPartialMock([AGCInitialsColors sharedInstance]);
    OCMExpect([agcColorsMock colorForString:@"AC"]);
    [_imageView agc_setImageWithInitials:@"AC"];
    OCMVerifyAll(agcColorsMock);
}

@end
