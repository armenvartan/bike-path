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

@synthesize stationJSON = _stationJSON;

+ (NSArray*)loadCitiBikeData{
    NSURL *url = [NSURL URLWithString:@"http://www.citibikenyc.com/stations/json"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: url
                                                           cachePolicy: NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval: 120.0];
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    if (data.length > 0 && error == nil)
    {
        NSDictionary *citiBikeJSON = [NSJSONSerialization JSONObjectWithData:data
                                                                     options:0
                                                                       error:NULL];
        NSArray* stations = [citiBikeJSON objectForKey:@"stationBeanList"];
        NSSortDescriptor *sortDescriptor;
        sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"availableBikes"
                                                     ascending:NO];
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
        NSArray* sortedStations = [stations sortedArrayUsingDescriptors:sortDescriptors];
        
        _stationJSON = sortedStations;
        
        for(id st in sortedStations) {
            NSDictionary *station = (NSDictionary *)st;
            NSString *lati             = [station objectForKey:@"latitude"];
            NSString *longi            = [station objectForKey:@"longitude"];
            CLLocation *location = [[CLLocation alloc] initWithLatitude:[lati doubleValue] longitude:([longi doubleValue] *2)];
            NSMutableArray *locations = [[NSMutableArray alloc] init];
            [locations addObject:location];
        }
    }
    return _stationJSON;
}

@end
