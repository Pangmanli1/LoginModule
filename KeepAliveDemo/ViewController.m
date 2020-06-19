//
//  ViewController.m
//  KeepAliveDemo
//
//  Created by Maria on 2020/6/18.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, assign)  NSInteger number;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.countDownBtn.backgroundColor = [UIColor lightGrayColor];
    [self.countDownBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self countDownBegin:self.countDownBtn];
    

}


- (void)countDownBegin:(UIButton *)sender{
    NSTimeInterval seconds =80000;
    NSDate *endTime = [NSDate dateWithTimeIntervalSinceNow:seconds];// 最后期限
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
//
//
//    dispatch_source_t _sometimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER,0,0, queue);
//    dispatch_source_set_timer(_sometimer, dispatch_walltime(NULL,0),1.0*NSEC_PER_SEC,0);// 每秒执行一次
//    dispatch_source_set_event_handler(_sometimer, ^{
//        int interval = [endTime timeIntervalSinceNow];
//        if(interval >0) {// 更新倒计时
//            NSString *timeStr = [NSString stringWithFormat:@"%ds", interval];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [sender setTitle:timeStr forState:UIControlStateNormal];                     sender.userInteractionEnabled =NO;
////                [sender setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//            });
//        }else{
//            // 倒计时结束，关闭
//            dispatch_source_cancel(_sometimer);
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [sender setTitle:@"获取验证码"forState:UIControlStateNormal];
//                [sender setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];                sender.userInteractionEnabled =YES;
//            });
//        }
//    });
//    dispatch_resume(_sometimer);
   
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f repeats:YES block:^(NSTimer * _Nonnull timer) {
//        int interval = [endTime timeIntervalSinceNow];
        self.number++;
        
        NSString *timeStr = [NSString stringWithFormat:@"%lds", (long)self.number];
        [sender setTitle:timeStr forState:UIControlStateNormal];
        sender.userInteractionEnabled =NO;
        NSLog(@"%@==%ld ",[NSDate date],self.number);

        
//        if(interval >0) {// 更新倒计时
//
//            NSString *timeStr = [NSString stringWithFormat:@"%ds", interval];
//            [sender setTitle:timeStr forState:UIControlStateNormal];
//            sender.userInteractionEnabled =NO;
//        }else{
//
//            [sender setTitle:@"获取验证码"forState:UIControlStateNormal];
//            [sender setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];                sender.userInteractionEnabled =YES;
//        }

    }];
     __block UIBackgroundTaskIdentifier bgTask;
    bgTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
            dispatch_async(dispatch_get_main_queue(), ^{
                if (bgTask != UIBackgroundTaskInvalid)
                {
                    [[UIApplication sharedApplication] endBackgroundTask:bgTask];
                    bgTask = UIBackgroundTaskInvalid;
                }
            });
        }];
    
}

@end
