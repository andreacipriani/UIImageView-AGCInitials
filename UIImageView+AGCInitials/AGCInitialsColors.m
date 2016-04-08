//
//  Created by Andrea Cipriani on 07/04/16.
//
//

#import "AGCInitialsColors.h"

@interface AGCInitialsColors ()

@property (nonatomic, strong) NSMutableDictionary<NSString*, UIColor*>* cachedColorsForStrings;

@end

@implementation AGCInitialsColors

+ (id _Nonnull)sharedInstance
{
    static AGCInitialsColors* sharedInstance = nil;
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
    _cachedColorsForStrings = [NSMutableDictionary new];
    return self;
}

- (NSArray<UIColor*>*)defaultColorPalette
{
    //TODO: create a cool default palette
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

- (UIColor* _Nonnull)colorForString:(NSString*)string
{
    if (string == nil){
        string = @"";
    }
    if ([self cachedColorForString:string]) {
        return [self cachedColorForString:string];
    }
    
    unsigned long hashNumber = djb2StringToLong((unsigned char*)[string UTF8String]);
    UIColor* color = _colorPalette[hashNumber % [_colorPalette count]];
    [_cachedColorsForStrings setObject:color forKey:string];
    return color;
}

-(UIColor*)cachedColorForString:(NSString*)string
{
    return [_cachedColorsForStrings objectForKey:string];
}

/*
 http://www.cse.yorku.ca/~oz/hash.html djb2 algorithm to generate an unsigned long hash from a given string
 
 Attention, this method could return different values on differente architectures for the same string
 */
unsigned long djb2StringToLong(unsigned char* str)
{
    unsigned long hash = 5381;
    int c;
    while ((c = *str++)){
        hash = ((hash << 5) + hash) + c;
    }
    return hash;
}

@end
