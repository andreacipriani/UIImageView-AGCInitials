//
//  Created by Andrea Cipriani on 07/04/16.
//
//

#import "AGCInitialsColors.h"
#import <XCTest/XCTest.h>

@interface AGCInitialsColorsTests : XCTestCase

@end

@implementation AGCInitialsColorsTests

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
    NSAssert([[AGCInitialsColors sharedInstance] colorPalette], @"Color palette shouldn't be nil by default");
}

- (void)testDefaultColorPaletteShouldHaveMoreThanTenColors
{
    NSArray* defaultColorPalette = [[AGCInitialsColors sharedInstance] colorPalette];
    NSAssert([defaultColorPalette count] >= 10, @"Default color palette should have more than ten colors");
}

-(void)testColorForStringShouldNotBeNil
{
    BOOL colorForFoo = [[AGCInitialsColors sharedInstance] colorForString:@"foo"];
    NSAssert(colorForFoo, @"Color for foo string should not be nil");
}

-(void)testColorForNilStringShouldNotBeNil
{
    BOOL colorForNilString = [[AGCInitialsColors sharedInstance] colorForString:nil];
    NSAssert(colorForNilString, @"Color for nil string should not be nil");
}

-(void)testColorForEmptyStringShouldNotBeNil
{
    BOOL colorForEmptyString = [[AGCInitialsColors sharedInstance] colorForString:@""];
    NSAssert(colorForEmptyString, @"Color for empty string should not be nil");
}

-(void)testColorsShouldBeContainedInPalette
{
    NSArray<UIColor*>* colorPalette = [[AGCInitialsColors sharedInstance] colorPalette];
    UIColor* colorForFoo = [[AGCInitialsColors sharedInstance] colorForString:@"foo"];
    UIColor* colorForBar = [[AGCInitialsColors sharedInstance] colorForString:@"foo"];
    UIColor* colorForLol = [[AGCInitialsColors sharedInstance] colorForString:@"lol"];
    UIColor* colorForEmptyString = [[AGCInitialsColors sharedInstance] colorForString:@""];
    UIColor* colorForNil = [[AGCInitialsColors sharedInstance] colorForString:@""];

    BOOL areColorsContainedInPalette = [colorPalette containsObject:colorForFoo] && [colorPalette containsObject:colorForBar] && [colorPalette containsObject:colorForLol] && [colorPalette containsObject:colorForEmptyString] && [colorPalette containsObject:colorForNil];
    NSAssert(areColorsContainedInPalette, @"Some returned color is not contained in the palette");
}

-(void)testColorsForSameStringShouldBeEqual
{
    UIColor* colorForFoo = [[AGCInitialsColors sharedInstance] colorForString:@"foo"];
    UIColor* colorForFoo2 = [[AGCInitialsColors sharedInstance] colorForString:@"foo"];
    NSAssert([colorForFoo isEqual:colorForFoo2], @"Colors for the same string are not equal");
}

- (void)testColorsDuplicateAreLessThanHalf
{
    NSMutableArray<UIColor*>* colors = [NSMutableArray new];
    for (NSString* string in @[@"foo",@"bar",@"lol",@"",@"a",@"b",@"c",@"I",@"just",@"want",@"some",@"string",@"to",@"test",@"the",@"randomness",@"distribution"]) {
        UIColor* colorForString = [[AGCInitialsColors sharedInstance] colorForString:string];
        [colors addObject:colorForString];
    }
    
    NSSet* colorsWithoutDuplicates = [NSSet setWithArray:colors];
    NSUInteger duplicateColorsCount = [colors count] - [colorsWithoutDuplicates count];
    BOOL areDuplicateColorsLessThanHalf = duplicateColorsCount < ([colors count] / 2);
    NSAssert(areDuplicateColorsLessThanHalf, @"Too many duplicate colors");
}

@end
