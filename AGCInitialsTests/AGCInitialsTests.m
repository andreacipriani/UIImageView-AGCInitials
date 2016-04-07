//
//  Created by Andrea Cipriani on 07/04/16.
//
//

#import <XCTest/XCTest.h>
#import "UIImageView+AGCInitials.h"
#import "OCMock.h"
#import "ACGInitialsColors.h"

@interface AGCInitialsTests : XCTestCase

@property UIImageView* imageView;

@end

@implementation AGCInitialsTests

- (void)setUp
{
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

-(void)testImageWithACGInitialsExist
{
    [_imageView agc_setImageWithInitials:@"AC"];
    NSAssert(_imageView.image, @"Image is nil after setting with initials");
}

#pragma mark - Initials + Colors collaboration

-(void)testColorForStringIsCalledCorrectly
{
    id acgColorsMock = OCMClassMock([ACGInitialsColors class]);
}

@end