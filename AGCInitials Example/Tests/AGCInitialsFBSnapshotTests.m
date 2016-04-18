//
//  Created by Andrea Cipriani on 18/04/16.
//

#import <XCTest/XCTest.h>
#import <FBSnapshotTestCase/FBSnapshotTestCase.h>
#import "UIImageView+AGCInitials.h"

@interface AGCInitialsFBSnapshotTests : FBSnapshotTestCase

#define IMAGE_VIEW_WIDTH 200
#define IMAGE_VIEW_HEIGHT 200

@property UIImageView* imageView;

@end

@implementation AGCInitialsFBSnapshotTests

- (void)setUp
{
    [super setUp];
    //self.recordMode = YES;
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testImageWithInitials_AC
{
    UIImageView *imageViewWithInitials_AC = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, IMAGE_VIEW_WIDTH, IMAGE_VIEW_HEIGHT)];
    [imageViewWithInitials_AC agc_setImageWithInitials:@"AC"];
    FBSnapshotVerifyView(imageViewWithInitials_AC, nil);
}

- (void)testImageViewWithInitials_AC_SystemFontSize19_PurpleColor
{
    UIImageView *imageViewWithInitials_AC_SystemFontSize19_PurpleColor = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, IMAGE_VIEW_WIDTH, IMAGE_VIEW_HEIGHT)];

    NSDictionary* initialsTextAttributes = @{ NSFontAttributeName : [UIFont systemFontOfSize:19], NSForegroundColorAttributeName : [UIColor purpleColor] };
    [imageViewWithInitials_AC_SystemFontSize19_PurpleColor agc_setImageWithInitials:@"AC" andTextAttributes:initialsTextAttributes];
    FBSnapshotVerifyView(imageViewWithInitials_AC_SystemFontSize19_PurpleColor, nil);
}

@end
