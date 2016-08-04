//
//  DYLYCustomerGetCrmMatrixEnumRequest.m
//  DYLYNetworkKitDemo
//
//  Created by Yanci on 16/8/4.
//  Copyright © 2016年 Yanci. All rights reserved.
//

#import "DYLYCustomerGetCrmMatrixEnumRequest.h"

@implementation DYLYCustomerGetCrmMatrixEnumRequest
@synthesize cachePolicy = _cachePolicy;
@synthesize cacheTimeOutInterval = _cacheTimeOutInterval;

- (id)init {
    if (self = [super init]) {
        _cachePolicy = MXRequestCachePolicyReturnCacheDataElseLoad;
        _cacheTimeOutInterval = 60 * 60 * 24;
    }
    return self;
}


@end
