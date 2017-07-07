# Introduce  (简介)

DYLYNetworkKit 是基于AFNetworking的更高一层封装, 封装方式基于Category, 调用方式基于Block。


# Features (功能)
+ 数据请求响应Model化

# Usage (使用)


1.导入 DYLYNetworkKit.h 

2.服务器接口Url映射定义
<pre><code> 
@implementation MXBaseUrl
+ (NSDictionary *)UrlMethodMapper {
    return @{
              @"方法名称": @"服务器接口Url",
              @"login" : @"http://api.what.com/login"
            };
}
</code></pre>

3.服务器请求定义
<pre><code> 
@interface MXLoginRequest : MXBaseRequest
@property(nonatmoic) NSString *phone;
@property(nonatmoic) NSString *password
@end

@implementation MXLoginRequest

- (id)init {
    if (self = [super init]) {}
    return self;
}

</code></pre>

4.服务器响应定义
<pre><code> 
@interface MXLoginResponse: MXBaseResponse
@property(nonatmoic) NSString *userId;
@Property(nonatmoic) NSString *username;
@property(nonatmoic) NSString *useravatar;
...
@end
</code></pre>

5.接口请求 (支持Post 和 Get 两种方式)
<pre><code> 
- (IBAction)test:(id)sender {
   MXLoginRequest *request = [[MXLoginRequest alloc]init];
    request.phone = @"电话号码";
    request.password = @"密码"
    
   [MXNetworkConnection sendPostRequestWithMethod:@"login" requestModel:request responseClass:[MXLoginResponse class] beforeSendCallback:^{
       // TODO: 调用前回调处理
   } SuccessCallBack:^(DYLYCustomerGetCrmMatrixEnumResponse *result) {
       // TODO: 成功回调处理
   } ErrorCallback:^(NSError *error) {
       // TODO: 错误回调处理
   } CompleteCallback:^(NSError *error, id result) {
       // TODO: 完成后回调处理
   }];
}
</code></pre>

#结束语

起初只是按照在项目遇到中的问题去封装一层网络层,并未考虑太多的设计模式以及代码耦合性,若哪里有地方可以改进以及不合理处,希望多加指教。Thanks !   

