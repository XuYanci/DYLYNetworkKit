//
//  MXBaseResponse.h
//  RoadShowLiveNetwork
//
//  Created by Yanci on 16/4/22.
//  Copyright © 2016年 Yanci. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MXBaseResponse : NSObject
 

/** 服务器放回相关参数定义 */
@property (nonatomic,strong)NSNumber *status;
@property (nonatomic,strong)NSString *msg;
@end
