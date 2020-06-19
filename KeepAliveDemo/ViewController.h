//
//  ViewController.h
//  KeepAliveDemo
//
//  Created by Maria on 2020/6/18.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *countDownBtn;
@property (nonatomic, strong)  NSTimer *timer;

@end

