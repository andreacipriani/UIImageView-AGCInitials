//
//  Created by Andrea Cipriani on 07/04/16.
//
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

- (void)testInitialsCustomTextAttributes
{
    NSDictionary* initialsTextAttributes = @{ NSFontAttributeName : [UIFont systemFontOfSize:19], NSForegroundColorAttributeName : [UIColor purpleColor] };
    [_imageView agc_setImageWithInitials:@"AC" andTextAttributes:initialsTextAttributes];
    //NSAssert([self isContentOfImage:expectedImage equalToContentOfImage:currentImage], @"Image with AC initials and custom text attributes is not the expected one");
    //TODO: use fbsnapshots
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
