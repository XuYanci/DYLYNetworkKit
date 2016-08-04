//
//  DYLYCustomerConceptEnumModel.m
//  FirstRoadNetwork
//
//  Created by Yanci on 16/6/8.
//  Copyright © 2016年 DYLY. All rights reserved.
//

#import "DYLYCustomerConceptEnumModel.h"
#import "DYLYEnumCommonModel.h"

@implementation DYLYCustomerConceptEnumModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
                @"list": [DYLYEnumCommonModel class],
                @"groupDescs" :[DYLYEnumCommonModel class],
             };
}
@end
