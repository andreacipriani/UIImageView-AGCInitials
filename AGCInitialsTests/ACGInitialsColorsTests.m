//
//  Created by Andrea Cipriani on 07/04/16.
//
//

#import "ACGInitialsColors.h"
#import <XCTest/XCTest.h>

@interface ACGInitialsColorsTests : XCTestCase

@end

@implementation ACGInitialsColorsTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testDefaultColorPaletteExist
{
    NSAssert([[ACGInitialsColors sharedInstance] colorPalette], @"Color palette shouldn't be nil by default");
}

- (void)testDefaultColorPaletteShouldHaveMoreThanTenColors
{
    NSArray* defaultColorPalette = [[ACGInitialsColors sharedInstance] colorPalette];
    NSAssert([defaultColorPalette count] >= 10, @"Default color palette should have more than ten colors");
}

@end
