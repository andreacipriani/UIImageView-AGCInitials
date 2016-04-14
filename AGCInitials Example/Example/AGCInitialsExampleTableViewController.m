//
//  Created by Andrea Cipriani on 11/04/16.
//
//

#import "AGCInitialsExampleTableViewController.h"
#import "AGCPerson.h"
#import "UIImageView+AGCInitials.h"

#define AGCCELL_IMAGEVIEW_TAG 996
#define AGCCELL_LABEL_TAG 997

@interface AGCInitialsExampleTableViewController ()

@property (nonatomic, strong) NSDictionary* peopleForInitials;

@end

@implementation AGCInitialsExampleTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadAGCPeopleForInitials];
}

- (void)loadAGCPeopleForInitials
{
    AGCPerson* alice = [[AGCPerson alloc] initWithName:@"Alice Arnold"];
    AGCPerson* andrea = [[AGCPerson alloc] initWithName:@"Andrea Brew"];
    AGCPerson* alease = [[AGCPerson alloc] initWithName:@"Alease Media"];
    AGCPerson* alyssa = [[AGCPerson alloc] initWithName:@"Alyssa Stof"];
    AGCPerson* bob = [[AGCPerson alloc] initWithName:@"Bob Mall"];
    AGCPerson* brigitte = [[AGCPerson alloc] initWithName:@"Brigitte Fell"];
    AGCPerson* brandi = [[AGCPerson alloc] initWithName:@"Brandi Xou"];
    AGCPerson* carl = [[AGCPerson alloc] initWithName:@"Carl Male"];
    AGCPerson* candy = [[AGCPerson alloc] initWithName:@"Candy Tele"];
    AGCPerson* claudette = [[AGCPerson alloc] initWithName:@"Claudette Rima"];
    AGCPerson* dan = [[AGCPerson alloc] initWithName:@"Dan Foo"];
    AGCPerson* dave = [[AGCPerson alloc] initWithName:@"Dave Scott"];
    AGCPerson* eve = [[AGCPerson alloc] initWithName:@"Eve Bar"];
    AGCPerson* ernest = [[AGCPerson alloc] initWithName:@"Ernest Walo"];

    _peopleForInitials = @{ @"A" : @[ alice, andrea, alease, alyssa ],
        @"B" : @[ bob, brigitte, brandi ],
        @"C" : @[ carl, candy, claudette ],
        @"D" : @[ dan, dave ],
        @"E" : @[ eve, ernest ] };
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return [[_peopleForInitials allKeys] count];
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
    case 0:
        return [_peopleForInitials[@"A"] count];
    case 1:
        return [_peopleForInitials[@"B"] count];
    case 2:
        return [_peopleForInitials[@"C"] count];
    case 3:
        return [_peopleForInitials[@"D"] count];
    case 4:
        return [_peopleForInitials[@"E"] count];
    default:
        return 0;
        break;
    }
}

- (nullable NSArray<NSString*>*)sectionIndexTitlesForTableView:(UITableView*)tableView
{
    return [[UILocalizedIndexedCollation currentCollation] sectionIndexTitles];
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{

    UITableViewCell* agcCell = [tableView dequeueReusableCellWithIdentifier:@"AGCCellIdentifier" forIndexPath:indexPath];
    AGCPerson* agcPersonForIndexPath = [self agcPersonForIndexPath:indexPath];
    [self configureAGCCell:agcCell withPerson:agcPersonForIndexPath];
    return agcCell;
}

- (AGCPerson*)agcPersonForIndexPath:(NSIndexPath*)indexPath
{
    switch (indexPath.section) {
    case 0:
        return [_peopleForInitials[@"A"] objectAtIndex:indexPath.row];
    case 1:
        return [_peopleForInitials[@"B"] objectAtIndex:indexPath.row];
    case 2:
        return [_peopleForInitials[@"C"] objectAtIndex:indexPath.row];
    case 3:
        return [_peopleForInitials[@"D"] objectAtIndex:indexPath.row];
    case 4:
        return [_peopleForInitials[@"E"] objectAtIndex:indexPath.row];
    default:
        return 0;
        break;
    }
}

- (void)configureAGCCell:(UITableViewCell*)agcCell withPerson:(AGCPerson*)agcPerson
{
    UIImageView* cellImageView = (UIImageView*)[agcCell viewWithTag:AGCCELL_IMAGEVIEW_TAG];
    NSDictionary* initialsTextAttributes = @{ NSFontAttributeName : [UIFont systemFontOfSize:20],NSForegroundColorAttributeName : [UIColor whiteColor] };
    [cellImageView agc_setImageWithInitialsFromName:agcPerson.name separatedByString:@" " withTextAttributes:initialsTextAttributes];
    UILabel* cellLabel = (UILabel*)[agcCell viewWithTag:AGCCELL_LABEL_TAG];
    cellLabel.text = agcPerson.name;
}

@end
