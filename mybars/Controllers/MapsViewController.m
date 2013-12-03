//
//  MapsViewController.m
//  mybars
//
//  Created by Aymeric Gallissot on 03/12/13.
//
//

#import "MapsViewController.h"
#import "ListViewController.h"

@interface MapsViewController ()

@end

@implementation MapsViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.title = @"Carte";
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:102.0/255.0 green:207.0/255.0 blue:203.0/255.0 alpha:1.0];
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Liste" style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonAction)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)leftBarButtonAction{
    ListViewController *listVC = [[ListViewController alloc] init];
    [self.navigationController pushViewController:listVC animated:YES];
}

@end
