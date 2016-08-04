//
//  ViewController.m
//  DYLYNetworkKitDemo
//
//  Created by Yanci on 16/8/3.
//  Copyright © 2016年 Yanci. All rights reserved.
//

#import "ViewController.h"
#import "DYLYNetworkKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    [MXRequest sendUserLogin:@"11111111111" customerPassword:[MD5 md532BitLower:@"111111"] beforeCallback:^{
        
    } successCallback:^(id result) {
        NSLog(@"%@",result);
    } errorCallback:^(NSError *error) {
        
    } completeCallback:^(NSError *error, id result) {
        
    }];
}

- (IBAction)test:(id)sender {
    DYLYCustomerGetCrmMatrixEnumRequest *request = [[DYLYCustomerGetCrmMatrixEnumRequest alloc]init];
    
   [MXNetworkConnection sendGetRequestWithMethod:@"customer_getCrmMatrixEnum" requestModel:request responseClass:[DYLYCustomerGetCrmMatrixEnumResponse class] beforeSendCallback:^{
       
   } SuccessCallBack:^(DYLYCustomerGetCrmMatrixEnumResponse *result) {
       
   } ErrorCallback:^(NSError *error) {
       
   } CompleteCallback:^(NSError *error, id result) {
       
   }];
}

@end
