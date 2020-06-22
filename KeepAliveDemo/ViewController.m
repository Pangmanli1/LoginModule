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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.countDownBtn.backgroundColor = [UIColor lightGrayColor];
    [self.countDownBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    FSCountDownTool * countDown = [FSCountDownTool new];
    
    [countDown countDownBegin:self.countDownBtn];
    
    

}



@end
