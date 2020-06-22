//
//  ViewController.m
//  KeepAliveDemo
//
//  Created by Maria on 2020/6/18.
//

#import "ViewController.h"
#import "FSCountDownTool.h"

@interface ViewController ()
@property (nonatomic, assign)  NSInteger number;
@property (nonatomic, strong)  FSCountDownTool *countDownTool;
@property (nonatomic, assign)  UIBackgroundTaskIdentifier bgTaskID;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.countDownBtn.backgroundColor = [UIColor lightGrayColor];
    [self.countDownBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.countDownTool countDownBegin:self.countDownBtn];
}


-(FSCountDownTool *)countDownTool {
    if (_countDownTool == nil) {
        _countDownTool = [FSCountDownTool new];
    }
    return _countDownTool;
}

@end
