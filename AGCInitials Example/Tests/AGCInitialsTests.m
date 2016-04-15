//
//  Created by Andrea Cipriani on 07/04/16.
//

#import "AGCInitialsColors.h"
#import "OCMock.h"
#import "UIImageView+AGCInitials.h"
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

- (void)testImageWithACGInitials
{
    [_imageView agc_setImageWithInitials:@"AC"];
    //TODO: use fbsnapshots
}

- (void)testInitialsCustomTextAttributes
{
    NSDictionary* initialsTextAttributes = @{ NSFontAttributeName : [UIFont systemFontOfSize:19], NSForegroundColorAttributeName : [UIColor purpleColor] };
    [_imageView agc_setImageWithInitials:@"AC" andTextAttributes:initialsTextAttributes];
    //TODO: use fbsnapshots
}

#pragma mark - Test initials from name

- (void)testImageWithInitialsFromName
{
    id imageViewMock = OCMPartialMock(_imageView);
    OCMExpect([imageViewMock agc_setImageWithInitials:@"AC"]);
    [imageViewMock agc_setImageWithInitialsFromName:@"Andrea Cipriani" separatedByString:@" "];
    OCMVerifyAll(imageViewMock);
}

- (void)testImageWithInitialsWithWrongSeparator
{
    id imageViewMock = OCMPartialMock(_imageView);
    OCMExpect([imageViewMock agc_setImageWithInitials:@"A"]);
    [imageViewMock agc_setImageWithInitialsFromName:@"Andrea Cipriani" separatedByString:@"*"];
    OCMVerifyAll(imageViewMock);
}

- (void)testInitialsForEmptyNameComponentsShouldBeEmpty
{
    id imageViewMock = OCMPartialMock(_imageView);
    OCMExpect([imageViewMock agc_setImageWithInitials:@""]);
    [imageViewMock agc_setImageWithInitialsFromName:@" " separatedByString:@" "];
    OCMVerifyAll(imageViewMock);
}

- (void)testInitialsForNameWithMoreThanTwoComponentsShouldUseFirstAndLastComponent
{
    id imageViewMock = OCMPartialMock(_imageView);
    OCMExpect([imageViewMock agc_setImageWithInitials:@"AC"]);
    [imageViewMock agc_setImageWithInitialsFromName:@"Andrea Guido Cipriani" separatedByString:@" "];
    OCMVerifyAll(imageViewMock);
}

- (void)testInitialsForNameThatStartsWithSeparator
{
    id imageViewMock = OCMPartialMock(_imageView);
    OCMExpect([imageViewMock agc_setImageWithInitials:@"AC"]);
    [imageViewMock agc_setImageWithInitialsFromName:@" Andrea Cipriani" separatedByString:@" "];
    OCMVerifyAll(imageViewMock);
}

- (void)testInitialsForNameWithMoreThanOneConsecutiveSeparator
{
    id imageViewMock = OCMPartialMock(_imageView);
    OCMExpect([imageViewMock agc_setImageWithInitials:@"AC"]);
    [imageViewMock agc_setImageWithInitialsFromName:@" Andrea    Cipriani   " separatedByString:@" "];
    OCMVerifyAll(imageViewMock);
}

#pragma mark - Initials + Colors collaboration

- (void)testImageWithInitialsWithColorForString
{
    id agcColorsMock = OCMPartialMock([AGCInitialsColors sharedInstance]);
    OCMExpect([agcColorsMock colorForString:@"AC"]);
    [_imageView agc_setImageWithInitials:@"AC"];
    OCMVerifyAll(agcColorsMock);
}

@end
