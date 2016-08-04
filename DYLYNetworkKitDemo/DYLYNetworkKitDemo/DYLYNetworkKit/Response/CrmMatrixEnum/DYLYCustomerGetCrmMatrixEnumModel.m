//
//  DYLYCustomerGetCrmMatrixEnumModel.m
//  FirstRoadNetwork
//
//  Created by Yanci on 16/6/8.
//  Copyright © 2016年 DYLY. All rights reserved.
//

#import "DYLYCustomerGetCrmMatrixEnumModel.h"
 
@implementation DYLYCustomerGetCrmMatrixEnumModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             
             @"customer_type" :[DYLYEnumCommonModel class],
             @"yearly_proj_scroll": [DYLYEnumCommonModel class],
             @"phase_enum": [DYLYEnumCommonModel class],
             @"favor_invest_type" : [DYLYEnumCommonModel class],
             @"net_earning_scroll": [DYLYEnumCommonModel class],
             @"financing_status": [DYLYEnumCommonModel class],
             @"single_proj_scroll":[DYLYEnumCommonModel class],
             @"proj_earning_scroll":[DYLYEnumCommonModel class],
             @"citys_role":[DYLYEnumCommonModel class],
             @"concept_enum":[DYLYCustomerConceptEnumModel class],
             @"concept_enum_black":[DYLYEnumCommonModel class],
             @"estimated_company_value":[DYLYEnumCommonModel class],
             @"financing_amt_scroll":[DYLYEnumCommonModel class],
             @"hot_citys":[DYLYEnumCommonModel class],
             @"capital_plan_enum" :[DYLYEnumCommonModel class]
             };
}
@end
