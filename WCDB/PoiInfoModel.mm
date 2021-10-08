//
//  PoiInfoModel.m
//  WCDB
//
//  Created by beaconnav on 2019/11/7.
//  Copyright © 2019 Mspacewiz. All rights reserved.
//

#import "PoiInfoModel.h"

@implementation PoiInfoModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"poiid": @"id",
                                                                  }];
}

WCDB_IMPLEMENTATION(PoiInfoModel)

WCDB_SYNTHESIZE(PoiInfoModel, name)
WCDB_SYNTHESIZE(PoiInfoModel, boundary)
WCDB_SYNTHESIZE(PoiInfoModel, floorid)
WCDB_SYNTHESIZE(PoiInfoModel, centpt)
WCDB_SYNTHESIZE(PoiInfoModel, poiid)
WCDB_SYNTHESIZE(PoiInfoModel, bid)

WCDB_VIRTUAL_TABLE_MODULE(PoiInfoModel, WCTModuleNameFTS3)
WCDB_VIRTUAL_TABLE_TOKENIZE(PoiInfoModel, WCTTokenizerNameWCDB)

@end
