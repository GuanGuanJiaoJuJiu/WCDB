//
//  Parking.h
//  WCDB
//
//  Created by beaconnav on 2019/3/7.
//  Copyright © 2019 Mspacewiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Parking : NSObject
@property (nonatomic, assign) int poiid;
@property (nonatomic, retain) NSString *poiname;
@property (nonatomic, retain) NSString *buildingname;
@property (nonatomic, retain) NSString *floorid;

@end

