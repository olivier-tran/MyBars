//
//  PinView.h
//  mybars
//
//  Created by Olivier TRAN on 04/12/2013.
//
//

#import <MapKit/MapKit.h>

@interface PinView : MKAnnotationView

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) NSString *title;

@end
