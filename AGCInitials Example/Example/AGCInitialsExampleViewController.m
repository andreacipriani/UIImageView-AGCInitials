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
@property (weak, nonatomic) IBOutlet UIImageView *rectangularImageView;

@end

@implementation AGCInitialsExampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"AGC Initials Example";
    
    [_imageView120 agc_setImageWithInitialsFromName:@"Mick Jagger" separatedByString:@" "];
    [_circularImageView120 agc_setImageWithInitials:@"MJ"];
    [_imageView60 agc_setImageWithInitialsFromName:@"Keith Richards" separatedByString:@" "];
    [_circularImageView60 agc_setImageWithInitials:@"KR"];
    [_imageView30 agc_setImageWithInitialsFromName:@"Brian Jones" separatedByString:@" "];
    [_circularImageView30 agc_setImageWithInitials:@"BJ"];
    [_rectangularImageView agc_setImageWithInitials:@"RC"];
}

@end
