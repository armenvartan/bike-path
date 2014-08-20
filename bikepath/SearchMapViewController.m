//
//  SearchMapViewController.m
//  bikepath
//
//  Created by Farheen Malik on 8/14/14.
//  Copyright (c) 2014 Bike Path. All rights reserved.
//

#import "SearchMapViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import <MapKit/MapKit.h>
#import "SearchItem.h"
#import "AppDelegate.h"
#import "GMSMarkerFactory.h"
#import "CacheStationJSON.h"

@interface SearchMapViewController ()

@end

@implementation SearchMapViewController {

}

- (void)viewDidLoad

{
    [super viewDidLoad];
    
    GMSCameraPosition *dbc = [GMSCameraPosition cameraWithLatitude:40.706638
                                                         longitude:-74.009070
                                                              zoom:16];
    [self.mapView setCamera:dbc];
    self.mapView.mapType                    = kGMSTypeNormal;
    self.mapView.myLocationEnabled          = YES;
    self.mapView.settings.compassButton     = YES;
    self.mapView.settings.myLocationButton  = YES;
    self.mapView.settings.zoomGestures      = YES;
    self.mapView.delegate                   = self;
    
    NSArray *sortedStations = [CacheStationJSON loadCitiBikeData:nil];
    
    for(NSDictionary *station in sortedStations) {
        [GMSMarkerFactory createGMSMarkerForStation: CLLocationCoordinate2DMake(
                [[station objectForKey:@"latitude"] doubleValue],
                [[station objectForKey:@"longitude"] doubleValue])
            mapView: self.mapView
            title: [station objectForKey:@"stationName"]
            availableSnippet: @"Number of available bikes"
            unavailableSnippet: @"No bikes availabe at this location"
            numberOfBikes: [station objectForKey:@"availableBikes"]];
    }
}

@end


