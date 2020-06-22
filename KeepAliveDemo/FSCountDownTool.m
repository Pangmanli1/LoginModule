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
@property (nonatomic, assign)  UIBackgroundTaskIdentifier bgTaskID;

@end
@implementation FSCountDownTool

- (void)countDownBegin:(UIButton *)sender{
    [self observeApplicationActionNotification];
    NSTimeInterval seconds = 600;
    NSDate *endTime = [NSDate dateWithTimeIntervalSinceNow:seconds];// 最后期限
    
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f repeats:YES block:^(NSTimer * _Nonnull timer) {
        int interval = [endTime timeIntervalSinceNow];
        NSLog(@"%@==%d ",[NSDate date],interval);
        
        if(interval >60) {// 更新倒计时
            if (sender) {
                
                NSString *timeStr = [NSString stringWithFormat:@"%ds", interval];
                [sender setTitle:timeStr forState:UIControlStateNormal];
                sender.userInteractionEnabled =NO;
            }
        }else if (interval > 0 && interval <= 400){
            
            NSLog(@"即将退出登录状态");

        }else{
            
            if (sender) {
                [sender setTitle:@"请重新登录"forState:UIControlStateNormal];
                [sender setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];                sender.userInteractionEnabled =YES;
            }
        }
        
    }];
}

#pragma mark observe status changes of application
- (void)observeApplicationActionNotification {

    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground) name: UIApplicationDidEnterBackgroundNotification object:nil];
}
- (void)dealloc {

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)applicationDidEnterBackground {
    [self beginTask];
}

- (void)applicationDidBecomeActive {

//    [self.countDownTool resetTimer];

}

#pragma mark backgroundTask begin ,end
- (void)beginTask
{
    self.bgTaskID = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{

        //如果在系统规定时间3分钟内任务还没有完成，在时间到之前会调用到这个方法
        [self endBack];
    }];
}

- (void)endBack
{
    //切记endBackgroundTask要和beginBackgroundTaskWithExpirationHandler成对出现
    [[UIApplication sharedApplication] endBackgroundTask:self.bgTaskID];
    self.bgTaskID = UIBackgroundTaskInvalid;
}


#pragma mark timer reset, pause and restart
-(void)resetTimer {
    [self.timer invalidate];
}

-(void)pauseTimer {
    [self.timer setFireDate:[NSDate distantFuture]];
}

-(void)restartTimer {
    [self.timer setFireDate:[NSDate date]];
    
}
@end
