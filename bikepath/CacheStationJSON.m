//
//  CacheStationJSON.m
//  bikepath
//
//  Created by Armen Vartan on 8/19/14.
//  Copyright (c) 2014 Bike Path. All rights reserved.
//

#import "CacheStationJSON.h"
#import <CoreLocation/CoreLocation.h>

@implementation CacheStationJSON

+ (NSData*)makeAPIRequest:(NSError*)error {
    NSMutableURLRequest *request = [NSMutableURLRequest
                                    requestWithURL:  [NSURL URLWithString:kCacheStationURL]
                                    cachePolicy:     NSURLRequestUseProtocolCachePolicy
                                    timeoutInterval: 120.0
                                    ];
    
    NSURLResponse *response = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    // write this data to disk
    return data;
}

+ (NSArray*)loadCitiBikeData:(NSError *)error {
    NSData *data = [self makeAPIRequest:error];
    if(error){ return nil; }
    
    NSDictionary *citiBikeJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if(error){ return nil; }
    
    NSArray* stations = [citiBikeJSON objectForKey:@"stationBeanList"];
    
    NSArray *sortDescriptors = [NSArray arrayWithObject:
        [[NSSortDescriptor alloc] initWithKey:@"availableBikes" ascending:NO]];
    
    NSArray *sortedStations = [stations sortedArrayUsingDescriptors:sortDescriptors];
    
    return sortedStations;
}

@end
