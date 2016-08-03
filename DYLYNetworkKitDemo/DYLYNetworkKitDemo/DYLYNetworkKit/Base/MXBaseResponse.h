//
//  MXBaseResponse.h
//  RoadShowLiveNetwork
//
//  Created by Yanci on 16/4/22.
//  Copyright © 2016年 Yanci. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MXBaseResponse : NSObject
@property (nonatomic,strong)NSNumber *status;
@property (nonatomic,strong)NSString *msg;
//@property (nonatomic,strong) id data;
@end
