//
//  Created by Andrea Cipriani on 07/04/16.
//
//

#import <UIKit/UIKit.h>

@interface UIImageView (AGCInitials)

@property (nonatomic, nullable, strong) NSArray<UIColor*>* agc_initialsColorPalette;

- (void)agc_setImageWithInitials:(nonnull NSString*)initials;
- (void)agc_setImageWithInitialsFromName:(nonnull NSString*)name separatedByString:(nonnull NSString*)separator;

@end
