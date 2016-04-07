//
//  Created by Andrea Cipriani on 07/04/16.
//
//

#import "AGCInitialsExampleViewController.h"
#import "UIImageView+AGCInitials.h"

@interface AGCInitialsExampleViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation AGCInitialsExampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_imageView agc_setImageWithInitials:@"AC"];
}

@end
