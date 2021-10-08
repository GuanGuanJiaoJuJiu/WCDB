//
//  Parking+TableCoding.h
//  WCDB
//
//  Created by beaconnav on 2019/3/7.
//  Copyright © 2019 Mspacewiz. All rights reserved.
//

#import "Parking.h"
#import <WCDB/WCDB.h>

@interface Parking (TableCoding)<WCTTableCoding>
//WCDB_PROPERTY(poiid)
WCDB_PROPERTY(poiname)
WCDB_PROPERTY(buildingname)
WCDB_PROPERTY(floorid)

@end

