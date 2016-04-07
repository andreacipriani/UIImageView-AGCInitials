//
//  Created by Andrea Cipriani on 07/04/16.
//
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface ACGInitialsColors : NSObject

+ (id _Nonnull)sharedInstance;
@property (nonatomic, nonnull, strong) NSArray<UIColor*>* colorPalette;

@end
