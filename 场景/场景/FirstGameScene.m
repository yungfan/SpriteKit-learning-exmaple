//
//  FirstGameScene.m
//  场景
//
//  Created by teacher on 17/2/20.
//  Copyright © 2017年 安徽商贸职业技术学院. All rights reserved.
//

#import "FirstGameScene.h"

@implementation FirstGameScene


-(instancetype)initWithSize:(CGSize)size{

    if (self = [super initWithSize:size]) {
        
        self.backgroundColor = [SKColor orangeColor];
        
    }
    
    return self;


}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    NSLog(@"%s", __func__);

}

@end
