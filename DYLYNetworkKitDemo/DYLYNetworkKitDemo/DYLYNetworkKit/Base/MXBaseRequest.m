//
//  MXBaseRequest.m
//  RoadShowLiveNetwork
//
//  Created by Yanci on 16/4/22.
//  Copyright © 2016年 Yanci. All rights reserved.
//

#import "MXBaseRequest.h"

@implementation MXBaseRequest

- (id)init {
    if (self = [super init]) {
        _cachePolicy = MXRequestCachePolicyReloadIgnoringLocalCacheData;
        _cacheTimeOutInterval = 60 * 60 * 24;
    }
    return self;
}




@end
