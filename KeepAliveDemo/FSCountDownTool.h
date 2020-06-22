//
//  FSCountDownTool.h
//  KeepAliveDemo
//
//  Created by Maria on 2020/6/22.
//  Copyright © 2020 formssi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FSCountDownTool : NSObject

- (void)countDownBegin:(UIButton *)sender;
-(void)resetTimer;

-(void)pauseTimer;
-(void)restartTimer;


@end

NS_ASSUME_NONNULL_END
