//
//  PoiInfoModel.h
//  WCDB
//
//  Created by beaconnav on 2019/11/7.
//  Copyright © 2019 Mspacewiz. All rights reserved.
//

#import "JSONModel.h"
#import "WCDB.h"
NS_ASSUME_NONNULL_BEGIN

@interface PoiInfoModel : JSONModel
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *centpt;
@property (nonatomic, strong) NSString *boundary;

@property (nonatomic, strong) NSNumber *poiid;
@property (nonatomic, strong) NSNumber *bid;
@property (nonatomic, strong) NSNumber *floorid;






@end

NS_ASSUME_NONNULL_END
