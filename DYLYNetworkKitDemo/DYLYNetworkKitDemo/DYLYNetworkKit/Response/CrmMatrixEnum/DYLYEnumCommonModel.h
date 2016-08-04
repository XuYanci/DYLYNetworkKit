//
//  DYLYEnumModel.h
//  FirstRoadNetwork
//
//  Created by Yanci on 16/5/26.
//  Copyright © 2016年 DYLY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DYLYEnumCommonModel : NSObject
@property (nonatomic,copy)NSString *enumCode;
@property (nonatomic,copy)NSString *enumDesc;
@property (nonatomic,copy)NSString *enumName;
@property (nonatomic,copy)NSString *enumGroupCode;
@property (nonatomic,copy)NSString *enumGroupCode2;

//服务案例字段
@property (nonatomic,copy)NSString *caseDesc;
@property (nonatomic,copy)NSString *caseName;
@property (nonatomic,copy)NSString *caseId;

@property (nonatomic,copy)NSString *objectId;

@property (nonatomic,copy)NSString *isCheck; /*! Extended , Not Model return*/
@end
