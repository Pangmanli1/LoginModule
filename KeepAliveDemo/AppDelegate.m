//
//  AppDelegate.m
//  KeepAliveDemo
//
//  Created by Maria on 2020/6/18.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (nonatomic, assign)  UIBackgroundTaskIdentifier  bgTaskID;
@property (nonatomic, assign)  NSInteger number;
@property (nonatomic, strong)  NSTimer *timer;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 
    
    // Override point for customization after application launch.
    return YES;
}

-(void)applicationDidEnterBackground:(UIApplication *)application {
//
//    [self beginTask];
//
//    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
//
//    self.number = 0;
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f repeats:YES block:^(NSTimer * _Nonnull timer) {
//        self.number++;
//        //        [UIApplication sharedApplication].applicationIconBadgeNumber = self.number;
//        if (self.number ==1000)
//        {
//            [self.timer invalidate];
//        }
//        NSLog(@"%@==%ld ",[NSDate date],self.number);
//    }];

    
//    self.bgTaskID = [application beginBackgroundTaskWithName:@"MyTask" expirationHandler:^{
//
//       [application endBackgroundTask:self.bgTaskID];
//       self.bgTaskID = UIBackgroundTaskInvalid;
//   }];
//
//   dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//
//       [application endBackgroundTask:self.bgTaskID];
//       self.bgTaskID = UIBackgroundTaskInvalid;
//   });
    
}


//app进入后台后保持运行
- (void)beginTask
{
    self.bgTaskID = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        
        //如果在系统规定时间3分钟内任务还没有完成，在时间到之前会调用到这个方法
        [self endBack];
    }];
}

//结束后台运行，让app挂起
- (void)endBack
{
    //切记endBackgroundTask要和beginBackgroundTaskWithExpirationHandler成对出现
    [[UIApplication sharedApplication] endBackgroundTask:self.bgTaskID];
    self.bgTaskID = UIBackgroundTaskInvalid;
}

@end
