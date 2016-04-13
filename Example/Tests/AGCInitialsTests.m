//
//  Created by Andrea Cipriani on 07/04/16.
//
//

#import "AGCInitialsColors.h"
#import "OCMock.h"
#import "UIImageView+AGCInitials.h"
#import <XCTest/XCTest.h>

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

- (void)testImageWithACGInitialsExist
{
    [_imageView agc_setImageWithInitials:@"AC"];
    NSAssert(_imageView.image, @"Image is nil after setting with initials");
}

- (void)testImageWithACGInitials
{
    [_imageView agc_setImageWithInitials:@"AC"];
    UIImage* expectedImage = [self imageFromResWithName:@"AC_default" ofType:@"png"];
    UIImage* currentImage = [self currentPNGImageFromImageView];
    NSAssert([self isContentOfImage:expectedImage equalToContentOfImage:currentImage], @"Image with AC initials is not the expected one");
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
    UIImage* expectedImage = [self imageFromResWithName:@"AC_systemfont19_purple" ofType:@"png"];
    UIImage* currentImage = [self currentPNGImageFromImageView];
    NSAssert([self isContentOfImage:expectedImage equalToContentOfImage:currentImage], @"Image with AC initials and custom text attributes is not the expected one");
}

#pragma mark - Initials + Colors collaboration

- (void)testImageWithInitialsWithColorForString
{
    id agcColorsMock = OCMPartialMock([AGCInitialsColors sharedInstance]);
    OCMExpect([agcColorsMock colorForString:@"AC"]);
    [_imageView agc_setImageWithInitials:@"AC"];
    OCMVerifyAll(agcColorsMock);
}

#pragma mark - Private utils

-(BOOL)isContentOfImage:(UIImage*)image1 equalToContentOfImage:(UIImage*)image2
{
    NSData *imageData1 = UIImagePNGRepresentation(image1);
    NSData *imageData2 = UIImagePNGRepresentation(image2);
    if ([imageData1 isEqualToData:imageData2]) {
        return YES;
    }
    return NO;
}

-(UIImage*)imageFromResWithName:(NSString*)imageName ofType:(NSString*)imageType
{
    NSBundle* bundle = [NSBundle bundleForClass:[self class]];
    NSString* imagePath = [bundle pathForResource:imageName ofType:imageType];
    return [UIImage imageWithContentsOfFile:imagePath];
}

-(UIImage*)currentPNGImageFromImageView
{
    return [UIImage imageWithData:UIImagePNGRepresentation(_imageView.image) scale:1];
}

@end
