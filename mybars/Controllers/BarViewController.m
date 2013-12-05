//
//  BarViewController.m
//  mybars
//
//  Created by Olivier TRAN on 12/5/13.
//
//

#import "BarViewController.h"
#import "ListViewController.h"
#import "Bar.h"

static float const kScrollViewContentSizeHeight = 600.0;

@interface BarViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end


@implementation BarViewController

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
    
    self.title = @"Bar";
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:102.0/255.0 green:207.0/255.0 blue:203.0/255.0 alpha:1.0];
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Retour" style:UIBarButtonItemStyleDone target:self action:@selector(goBackAction)];
    
    // ScrollView
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, self.view.bounds.size.height)];
    self.scrollView.backgroundColor = [UIColor blackColor];
    self.scrollView.contentSize = CGSizeMake(320, kScrollViewContentSizeHeight);
    [self.view addSubview:self.scrollView];
    
    // Image
    UIImageView *barView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 267.0)];
    barView.image = [UIImage imageNamed:@"bar-1"];
    [self.scrollView addSubview:barView];
    
    // Title
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 225.0, 290.0, 20.0)];
    title.backgroundColor = [UIColor clearColor];
    title.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:18.0];
    title.textColor = [UIColor whiteColor];
    title.text = @"La Mécanique Ondulatoire";
    [self.scrollView addSubview:title];
    
    // Address
    UILabel *address = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 245.0, 290.0, 20.0)];
    address.backgroundColor = [UIColor clearColor];
    address.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12.0];
    address.textColor = [UIColor whiteColor];
    address.text = @"8, Passage Thiéré";
    [self.scrollView addSubview:address];
    
    // City
    UILabel *city = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 259.0, 290.0, 20.0)];
    city.backgroundColor = [UIColor clearColor];
    city.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12.0];
    city.textColor = [UIColor whiteColor];
    city.text = @"75011 Paris";
    [self.scrollView addSubview:city];
    
    // + UIButton (details)
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button.layer setBorderColor: [[UIColor blackColor] CGColor]];
    [button.layer setBorderWidth: 2.0];
    button.frame = CGRectMake(170.0, 254.0, 140.0, 25.0);
    button.titleLabel.font = [UIFont systemFontOfSize: 12];
    [button setTitle:@"Bar / Salle de concerts" forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    [self.scrollView addSubview:button];

    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 305.0, self.view.bounds.size.width, 1.0)];
    lineView.backgroundColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.5];
    [self.scrollView addSubview:lineView];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(71.0, 360.0, 50.0, 1.0)];
    line.backgroundColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.5];
    [self.scrollView addSubview:line];
    
    // Beer Icon
    UIImageView *beer = [[UIImageView alloc] initWithFrame:CGRectMake(150.0, 343.0, 25.0, 30.0)];
    beer.image = [UIImage imageNamed:@"icon-beer-big"];
    [self.scrollView addSubview:beer];

    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(199.0, 360.0, 50.0, 1.0)];
    line2.backgroundColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.5];
    [self.scrollView addSubview:line2];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goBackAction{
    BarViewController *barVC = [[BarViewController alloc] init];
    barVC.data = self.data;
    [self.navigationController popViewControllerAnimated :YES];
}

@end
