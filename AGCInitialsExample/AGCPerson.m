//
//  Created by Andrea Cipriani on 12/04/16.
//
//

#import "AGCPerson.h"

@implementation AGCPerson

- (instancetype)initWithName:(NSString*)name
{
    self = [super init];
    if (!self) {
        return nil;
    }
    _name = name;
    return self;
}

- (NSString*)sectionIdentifier
{
    return [_name substringToIndex:1];
}

@end
