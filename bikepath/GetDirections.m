//
//  GetDirections.m
//  bikepath
//
//  Created by Apprentice on 8/15/14.
//  Copyright (c) 2014 Bike Path. All rights reserved.
//

#import "GetDirections.h"
#import "AFNetworking.h"

@implementation GetDirections
    -(void) Directions {
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:@"https://maps.googleapis.com/maps/api/directions/json?mode=bycycling&origin=40.706038+-74.009070&destination=40.706638+-74.009070&z=12&key=AIzaSyDeifXgaBJFQSSUNQuC88lCq3M43tej5o4" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"JSON: %@", responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
        return;
    };
@end
