//
//  CacheStationJSON.h
//  bikepath
//
//  Created by Armen Vartan on 8/19/14.
//  Copyright (c) 2014 Bike Path. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *kCacheStationURL = @"http://www.citibikenyc.com/stations/json";

@interface CacheStationJSON : NSObject

@property (nonatomic, retain) NSArray *stationJSON;
+ (NSArray*)loadCitiBikeData:(NSError *)error;
+ (NSData*)makeAPIRequest:(NSError*)error;

@end
