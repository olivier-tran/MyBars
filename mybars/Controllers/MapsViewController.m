//
//  MapsViewController.m
//  mybars
//
//  Created by Olivier TRAN on 03/12/13.
//
//

#import "MapsViewController.h"
#import "ListViewController.h"
#import "Bar.h"
#import "PinView.h"

@import MapKit;

@interface MapsViewController () <MKMapViewDelegate>

@property (strong, nonatomic) MKMapView *mapView;
@property (strong, nonatomic) NSArray *data;

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
    
    
    // Data
    Bar *bar1 = [Bar new];
    bar1.name = @"La Mécanique Ondulatoire";
    bar1.address = @"8, Passage Thiéré - 11e";
    bar1.price = @"4€";
    bar1.image = @"image-list-1";
    bar1.lat = 48.866973;
    bar1.lng = 2.349701;
    
    Bar *bar2 = [Bar new];
    bar2.name = @"L'UFO";
    bar2.address = @"49, rue Jean-Pierre Thimbaud - 11e";
    bar2.price = @"3,5€";
    bar2.image = @"image-list-2";
    bar2.lat = 48.87149;
    bar2.lng = 2.362747;
    
    Bar *bar3 = [Bar new];
    bar3.name = @"La Mécanique Ondulatoire";
    bar3.address = @"8, Passage Thiéré - 11e";
    bar3.price = @"4€";
    bar3.image = @"image-list-x";
    bar3.lat = 48.856809;
    bar3.lng = 2.355537;
    
    self.data = @[bar1,bar2,bar3];
    
    // MapKit
    self.mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height)];
    [self.mapView setDelegate:self];
    [self.mapView setMapType:MKMapTypeStandard];
    [self.view addSubview:self.mapView];
    
    [self addAnnotations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)leftBarButtonAction{
    ListViewController *listVC = [[ListViewController alloc] init];
    listVC.data = self.data;
    [self.navigationController pushViewController:listVC animated:YES];
}

- (void)addAnnotations{
    
    NSMutableArray *annotations = [[NSMutableArray alloc] init];
    
    [self.data enumerateObjectsUsingBlock:^(Bar *bar, NSUInteger idx, BOOL *stop) {
        PinView *pin = [[PinView alloc] init];
        pin.coordinate = CLLocationCoordinate2DMake(bar.lat, bar.lng);
        pin.title = bar.name;
        
        [annotations addObject:pin];
    }];

    [self.mapView addAnnotations:annotations];

    
    // Center region
    MKCoordinateRegion region;
    region.center = ((PinView *)[self.mapView.annotations objectAtIndex:0]).coordinate;
    MKCoordinateSpan span;
    span.latitudeDelta  = 0.05;
    span.longitudeDelta = 0.05;
    region.span = span;
    [self.mapView setRegion:region animated:YES];
}

@end
