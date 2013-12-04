//
//  Bar.h
//  mybars
//
//  Created by Aymeric Gallissot on 04/12/2013.
//
//

#import <Foundation/Foundation.h>

@interface Bar : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *image;
@property (nonatomic) float lat;
@property (nonatomic) float lng;

@end
