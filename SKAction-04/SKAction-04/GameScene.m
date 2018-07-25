//
//  GameScene.m
//  SKAction-01
//
//  Created by teacher on 17/3/7.
//  Copyright © 2017年 安徽商贸职业技术学院. All rights reserved.
//

#import "GameScene.h"

@interface GameScene()


//是否反向
@property(nonatomic, assign) BOOL isReverse;

@end

@implementation GameScene


#pragma mark - 添加两个精灵 一个是背景一个是飞机
-(void)didMoveToView:(SKView *)view{
    
    [super didMoveToView:view];
    
    [self backGroundNode];
    
    [self planeNode];
    
    //不是反向
    self.isReverse = NO;
}


#pragma mark - 添加背景精灵 设置位置为全屏
-(void)backGroundNode{
    
    SKSpriteNode *bg = [SKSpriteNode spriteNodeWithImageNamed:@"bg.jpg"];
    
    bg.size = self.size;
    
    bg.position = CGPointZero;
    
    bg.anchorPoint = CGPointZero;
    
    bg.zPosition = 0;
    
    [self addChild:bg];

}

#pragma mark - 添加飞机精灵 设置位置为屏幕居中
-(void)planeNode{
    
    SKSpriteNode *plane = [SKSpriteNode spriteNodeWithImageNamed:@"plane.png"];
   
    plane.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    
    plane.zPosition = 1;
  
    //设置名字 可以方便取出来
    plane.name = @"plane";

    [self addChild:plane];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPathRef path = CGPathCreateWithRect(CGRectMake(0, 0, 100, 100), nil);
    
    SKAction *pathAction = [SKAction followPath:path duration:2.0];
    
    SKAction *rotateAction = [SKAction rotateToAngle:M_PI duration:1.0];
    
    //序列化动作sequence
    SKAction *sequenceAction = [SKAction sequence:@[rotateAction, pathAction]];
    
    //与序列动作最大的区别 组动作是同时执行的 而序列化动作是按照数组的顺序执行的
    //SKAction *groupAction = [SKAction group:@[pathAction, rotateAction]];
    
    SKSpriteNode *plane = (SKSpriteNode *)[self childNodeWithName:@"plane"];
    
//    [plane runAction:sequenceAction];
    
    SKAction *blockAction = [SKAction runBlock:^{
        
        //在Block中执行我们的序列动作
        [plane runAction:sequenceAction];
        
    }];
    
    [plane runAction:blockAction];
}



@end
