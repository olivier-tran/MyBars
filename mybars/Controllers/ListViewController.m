//
//  ListViewController.m
//  mybars
//
//  Created by Aymeric Gallissot on 03/12/13.
//
//

#import "ListViewController.h"

@interface ListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *data;

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
    
    // Data
    self.data = @[
                  @{@"title":@"La Mécanique Ondulatoire", @"address":@"8, Passage Thiéré - 11e", @"price":@"4€", @"image":@"image-list-1"},
                  @{@"title":@"L'UFO", @"address":@"15, rue Henry - 13e", @"price":@"14€", @"image":@"image-list-2"},
                  @{@"title":@"La Mécanique Ondulatoire", @"address":@"8, Passage Thiéré - 11e", @"price":@"4€", @"image":@"image-list-x"}
                  ];
    
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
    NSDictionary *object = [self.data objectAtIndex:indexPath.row];
    
    // Image
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 110.0)];
    imageView.image = [UIImage imageNamed:[object objectForKey:@"image"]];
    [cell addSubview:imageView];
    
    // Title
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 20.0, 290.0, 20.0)];
    title.backgroundColor = [UIColor clearColor];
    title.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:18.0];
    title.textColor = [UIColor whiteColor];
    title.text = [object objectForKey:@"title"];
    [cell addSubview:title];
    
    
    // + UILabel (address)
    // + UILabel (price)
    // + UIImageView (icon)
    // + UIButton (details)
    
    // Border bottom
    CALayer *borderBottom = [[CALayer alloc] init];
    borderBottom.frame = CGRectMake(0.0, 109.0, 320.0, 2.0);
    borderBottom.backgroundColor = [UIColor blackColor].CGColor;
    [cell.layer addSublayer:borderBottom];
    
    return cell;
}

@end
