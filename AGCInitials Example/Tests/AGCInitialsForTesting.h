#import <Foundation/Foundation.h>

@interface AGCInitialsForTesting : NSObject

- (void)agc_setImageWithInitials:(nonnull NSString*)initials stringForColor:(nonnull NSString*)string textAttributes:(nonnull NSDictionary*)textAttributes; //So tests can view this private method of the category

@end
