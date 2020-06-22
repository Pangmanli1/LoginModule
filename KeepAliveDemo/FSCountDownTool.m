//
//  FSCountDownTool.m
//  KeepAliveDemo
//
//  Created by Maria on 2020/6/22.
//  Copyright © 2020 formssi. All rights reserved.
//

#import "FSCountDownTool.h"

@interface FSCountDownTool ()

@property (nonatomic, strong)  NSTimer *timer;
@property (nonatomic, strong)  UIAlertController *alertVC;
//@property (nonatomic, assign)  UIBackgroundTaskIdentifier bgTaskID;

@end
@implementation FSCountDownTool

- (void)countDownBegin:(UIButton *)sender{
    NSTimeInterval seconds = 600;
    NSDate *endTime = [NSDate dateWithTimeIntervalSinceNow:seconds];// 最后期限
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f repeats:YES block:^(NSTimer * _Nonnull timer) {
        int interval = [endTime timeIntervalSinceNow];
        NSLog(@"%@==%d ",[NSDate date],interval);
        
        if(interval >60) {// 更新倒计时
            
            NSString *timeStr = [NSString stringWithFormat:@"%ds", interval];
            [sender setTitle:timeStr forState:UIControlStateNormal];
            sender.userInteractionEnabled =NO;
        }else if (interval > 0 && interval <= 60){
            
            NSLog(@"即将退出登录状态");
//            [self.alertVC addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
//                   }]];
//            [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:self.alertVC animated:YES completion:nil];
        }else{
            
            [sender setTitle:@"请重新登录"forState:UIControlStateNormal];
            [sender setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];                sender.userInteractionEnabled =YES;
        }
        
    }];
    __block UIBackgroundTaskIdentifier bgTask;
    bgTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
//        dispatch_async(dispatch_get_main_queue(), ^{
            if (bgTask != UIBackgroundTaskInvalid)
            {
                [[UIApplication sharedApplication] endBackgroundTask:bgTask];
                bgTask = UIBackgroundTaskInvalid;
            }
//        });
    }];
    
}

-(void)resetTimer {
    [self.timer invalidate];
}


//- (void)dealloc {
//
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}
//
//- (void)observeApplicationActionNotification {
//
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground) name: UIApplicationDidEnterBackgroundNotification object:nil];
//}
//
//- (void)applicationDidEnterBackground {
//    [self beginTask];
////    [self countDownBegin:self.countDownBtn];
//
//}
//
//- (void)applicationDidBecomeActive {
//
//
//}
//
//- (void)beginTask
//{
//    self.bgTaskID = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
//
//        //如果在系统规定时间3分钟内任务还没有完成，在时间到之前会调用到这个方法
//        [self endBack];
//    }];
//}
//
////结束后台运行，让app挂起
//- (void)endBack
//{
//    //切记endBackgroundTask要和beginBackgroundTaskWithExpirationHandler成对出现
//    [[UIApplication sharedApplication] endBackgroundTask:self.bgTaskID];
//    self.bgTaskID = UIBackgroundTaskInvalid;
//}


-(UIAlertController *)alertVC {
    if (_alertVC) {
        _alertVC = [UIAlertController alertControllerWithTitle:@""message:@"即将登出" preferredStyle:UIAlertControllerStyleAlert];
    }
    return _alertVC;
}

@end
