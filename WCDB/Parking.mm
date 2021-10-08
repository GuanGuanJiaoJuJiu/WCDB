//
//  Parking.m
//  WCDB
//
//  Created by beaconnav on 2019/3/7.
//  Copyright © 2019 Mspacewiz. All rights reserved.
//

#import "Parking.h"
#import <WCDB/WCDB.h>

@implementation Parking
WCDB_IMPLEMENTATION(Parking)
//WCDB_SYNTHESIZE(Parking, poiid)
WCDB_SYNTHESIZE(Parking, poiname)
WCDB_SYNTHESIZE(Parking, buildingname)
WCDB_SYNTHESIZE(Parking, floorid)

WCDB_VIRTUAL_TABLE_MODULE(Parking, WCTModuleNameFTS3)
WCDB_VIRTUAL_TABLE_TOKENIZE(Parking, WCTTokenizerNameWCDB)

@end
