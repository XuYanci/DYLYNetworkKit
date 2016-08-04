//
//  DYLYCustomerGetCrmMatrixEnumModel.h
//  FirstRoadNetwork
//
//  Created by Yanci on 16/6/8.
//  Copyright © 2016年 DYLY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYLYEnumCommonModel.h"
#import "DYLYCustomerConceptEnumModel.h"

@interface DYLYCustomerGetCrmMatrixEnumModel : NSObject
@property (nonatomic,strong)NSArray *customer_type;
@property (nonatomic,strong)NSArray *yearly_proj_scroll;
@property (nonatomic,strong)NSArray *phase_enum;
@property (nonatomic,strong)NSArray *favor_invest_type;
@property (nonatomic,strong)NSArray *net_earning_scroll;
@property (nonatomic,strong)NSArray *financing_status;
@property (nonatomic,strong)NSArray *single_proj_scroll;
@property (nonatomic,strong)NSArray *proj_earning_scroll;
@property (nonatomic,strong)NSArray *citys_role;
@property (nonatomic,strong)DYLYCustomerConceptEnumModel *concept_enum;
@property (nonatomic,strong)NSArray *concept_enum_black;
@property (nonatomic,strong)NSArray *estimated_company_value;
@property (nonatomic,strong)NSArray *financing_amt_scroll;
@property (nonatomic,strong)NSArray *hot_citys;
@property (nonatomic,strong)NSArray *capital_plan_enum;

@end
