//
//  Created by Andrea Cipriani on 07/04/16.
//
//

#import "ACGInitialsColors.h"

@interface ACGInitialsColors ()

@end

@implementation ACGInitialsColors

+ (id _Nonnull)sharedInstance
{
    static ACGInitialsColors* sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] initWithDefaultColorPalette];
    });
    return sharedInstance;
}

- (instancetype)initWithDefaultColorPalette
{
    self = [super init];
    if (!self) {
        return nil;
    }
    _colorPalette = [self defaultColorPalette];
    return self;
}

- (NSArray<UIColor*>*)defaultColorPalette
{
    NSMutableArray<UIColor*>* defaultColorPalette = [NSMutableArray array];
    for (float hue = 0.0; hue < 1.0; hue += 0.05) {
        UIColor* color = [UIColor colorWithHue:hue saturation:0.5 brightness:0.5 alpha:1.0];
        [defaultColorPalette addObject:color];
    }
    return defaultColorPalette;
}

- (void)setPalette:(NSArray<UIColor*>*)colorPalette
{
    _colorPalette = colorPalette;
}

@end
