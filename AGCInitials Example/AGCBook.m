#import "AGCBook.h"
#import "NSObject+AGCDescription.h"

@implementation AGCBook

- (instancetype)initWithTitle:(NSString*)title author:(NSString*)author createdAt:(NSDate*)createdAd characters:(NSArray<NSString*>*)characters adaptions:(NSDictionary<NSNumber*, NSString*>*)adaptions
{
    self = [super init];
    if (!self) {
        return nil;
    }

    _title = title;
    _author = author;
    _createdAt = createdAd;
    _characters = characters;
    _adaptions = adaptions;

    return self;
}

- (NSString*)description
{
    return [self agc_description];
}

- (NSString*)debugDescription
{
    return [self agc_debugDescription];
}

@end
