//
//  ListViewController.m
//  mybars
//
//  Created by Olivier TRAN on 03/12/13.
//
//

#import "ListViewController.h"
#import "BarViewController.h"
#import "Bar.h"

@interface ListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ListViewController

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
	
    self.title = @"Liste";
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:102.0/255.0 green:207.0/255.0 blue:203.0/255.0 alpha:1.0];
    self.navigationController.navigationBar.translucent = NO;
    
    // TableView
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor darkGrayColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(self.data.count > 0){
        return self.data.count;
    }
    else{
        return 0;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 111;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
    
    // Cell selection
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell setBackgroundColor:[UIColor darkGrayColor]];
    
    // Object data
    Bar *bar = [self.data objectAtIndex:indexPath.row];
    
    // Image
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 110.0)];
    imageView.image = [UIImage imageNamed:bar.image];
    [cell addSubview:imageView];
    
    // Title
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 20.0, 290.0, 20.0)];
    title.backgroundColor = [UIColor clearColor];
    title.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:18.0];
    title.textColor = [UIColor whiteColor];
    title.text = bar.name;
    [cell addSubview:title];
    
    // Address Icon
    UIImageView *pin = [[UIImageView alloc] initWithFrame:CGRectMake(15.0, 43.0, 9.0, 15.0)];
    pin.image = [UIImage imageNamed:@"icon-pin"];
    [cell addSubview:pin];
    
    // + UILabel (address)
    UILabel *address = [[UILabel alloc] initWithFrame:CGRectMake(33.5, 44.0, 200.0, 10.0)];
    address.backgroundColor = [UIColor clearColor];
    address.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12.0];
    address.textColor = [UIColor whiteColor];
    address.text = bar.address;
    [cell addSubview:address];
    
    // Beer Icon
    UIImageView *beer = [[UIImageView alloc] initWithFrame:CGRectMake(15.0, 62.5, 11.0, 13.0)];
    beer.image = [UIImage imageNamed:@"icon-beer"];
    [cell addSubview:beer];
    
    // + UILabel (price)
    UILabel *price = [[UILabel alloc] initWithFrame:CGRectMake(33.5, 58.5, 160.0, 20.0)];
    price.backgroundColor = [UIColor clearColor];
    price.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12.0];
    price.textColor = [UIColor whiteColor];
    price.text = bar.price;
    [cell addSubview:price];
    
    // + UIButton (details)
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(222.0, 82.0, 72.0, 21.0);
    [button setTitle:@"Details" forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"button-hover"] forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:button];


    // Border bottom
    CALayer *borderBottom = [[CALayer alloc] init];
    borderBottom.frame = CGRectMake(0.0, 109.0, 320.0, 2.0);
    borderBottom.backgroundColor = [UIColor blackColor].CGColor;
    [cell.layer addSublayer:borderBottom];
    
    return cell;
}

-(void) buttonPressed {
    BarViewController *barVC = [[BarViewController alloc] init];
    barVC.data = self.data;
    [self.navigationController pushViewController:barVC animated:YES];
}

@end
