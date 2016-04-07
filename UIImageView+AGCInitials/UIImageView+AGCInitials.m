//
//  Created by Andrea Cipriani on 07/04/16.
//
//

#import "UIImageView+AGCInitials.h"
#import "AGCInitialsColors.h"

@implementation UIImageView (AGCInitials)

- (void)agc_setImageWithInitials:(nonnull NSString*)initials
{
    UIColor* colorForInitials = [[AGCInitialsColors sharedInstance] colorForString:initials];
    [self acg_fillImageWithColor:colorForInitials];
}

- (void)agc_setImageWithInitialsFromName:(nonnull NSString*)name separatedByString:(nonnull NSString*)separator
{
    
}

#pragma mark - Private utils

- (void)acg_fillImageWithColor:(UIColor*)color
{
    CGContextRef context = [self acg_imageContext];
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, [self acg_imageWidth], [self acg_imageHeight]));
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    [self acg_endContext];
}

- (CGContextRef)acg_imageContext
{
    UIGraphicsBeginImageContextWithOptions([self acg_imageSize], NO, [self acg_imageScale]);
    return UIGraphicsGetCurrentContext();
}

- (CGFloat)acg_imageScale
{
    return [UIScreen mainScreen].scale;
}

- (CGSize)acg_imageSize
{
    return self.bounds.size;
}

- (CGFloat)acg_imageWidth
{
    return [self acg_imageSize].width;
}

- (CGFloat)acg_imageHeight
{
    return [self acg_imageSize].height;
}

- (void)acg_endContext
{
    UIGraphicsEndImageContext();
}

@end
