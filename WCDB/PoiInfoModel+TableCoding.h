//
//  PoiInfoModel+TableCoding.h
//  WCDB
//
//  Created by beaconnav on 2019/11/7.
//  Copyright © 2019 Mspacewiz. All rights reserved.
//

#import "PoiInfoModel.h"
#import <WCDB/WCDB.h>

NS_ASSUME_NONNULL_BEGIN

@interface PoiInfoModel (TableCoding)<WCTTableCoding>
WCDB_PROPERTY(name)
WCDB_PROPERTY(boundary)
WCDB_PROPERTY(floorid)
WCDB_PROPERTY(centpt)
WCDB_PROPERTY(poiid)
WCDB_PROPERTY(bid)

@end

NS_ASSUME_NONNULL_END
