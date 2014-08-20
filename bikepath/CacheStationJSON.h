//
//  CacheStationJSON.h
//  bikepath
//
//  Created by Armen Vartan on 8/19/14.
//  Copyright (c) 2014 Bike Path. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheStationJSON : NSObject

@property (nonatomic, retain) NSArray *stationJSON;
+ (NSArray*)loadCitiBikeData;

@end
