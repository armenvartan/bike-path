//
//  bikepathTests.m
//  bikepathTests
//
//  Created by Vivek George, Molly Huerster, Farheen Malik and Armen Vartan on 8/14/14.
//  Copyright (c) 2014 Bike Path. All rights reserved.
//

#import "Kiwi.h"
#import "CacheStationJSON.h"

SPEC_BEGIN(MathSpec)

//describe(@"Math", ^{
//    it(@"is pretty cool", ^{
//        NSUInteger a = 16;
//        NSUInteger b = 26;
//        [[theValue(a + b) should] equal:theValue(43)];
//    });
//});

describe(@"CacheStationJSON", ^{
    it(@"fetches station example", ^{
        NSError *error = nil;
        NSArray *stations = [CacheStationJSON loadCitiBikeData: error];
        NSLog(stations);
        
    });
});

SPEC_END
