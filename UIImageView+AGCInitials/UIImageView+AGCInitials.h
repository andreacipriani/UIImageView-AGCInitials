//
//  Created by Andrea Cipriani on 07/04/16.
//
//

#import <UIKit/UIKit.h>
@class AGCInitialsColors;
@interface UIImageView (AGCInitials)

- (void)agc_setImageWithInitials:(nonnull NSString*)initials;
- (void)agc_setImageWithInitialsFromName:(nonnull NSString*)name separatedByString:(nonnull NSString*)separator;

-(AGCInitialsColors*)agc_initialsColors;

@end
