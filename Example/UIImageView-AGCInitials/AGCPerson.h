//
//  Created by Andrea Cipriani on 12/04/16.
//
//

#import <Foundation/Foundation.h>

@interface AGCPerson : NSObject

- (instancetype)initWithName:(NSString*)name;

@property (nonatomic, strong) NSString* name;

- (NSString*)sectionIdentifier;

@end
