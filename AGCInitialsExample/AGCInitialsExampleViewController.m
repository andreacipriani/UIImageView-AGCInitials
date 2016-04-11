//
//  Created by Andrea Cipriani on 07/04/16.
//
//

#import "AGCInitialsExampleViewController.h"
#import "UIImageView+AGCInitials.h"

@interface AGCInitialsExampleViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView120;
@property (weak, nonatomic) IBOutlet UIImageView *circularImageView120;
@property (weak, nonatomic) IBOutlet UIImageView *imageView60;
@property (weak, nonatomic) IBOutlet UIImageView *circularImageView60;
@property (weak, nonatomic) IBOutlet UIImageView *imageView30;
@property (weak, nonatomic) IBOutlet UIImageView *circularImageView30;

@end

@implementation AGCInitialsExampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_imageView120 agc_setImageWithInitialsFromName:@"Andrea Cipriani" separatedByString:@" "];
    [_circularImageView120 agc_setImageWithInitials:@"AC"];
    [_imageView60 agc_setImageWithInitialsFromName:@"Mick Jagger" separatedByString:@" "];
    [_circularImageView60 agc_setImageWithInitials:@"MJ"];
    [_imageView30 agc_setImageWithInitialsFromName:@"Keith Richards" separatedByString:@" "];
    [_circularImageView30 agc_setImageWithInitials:@"KR"];
}

@end
