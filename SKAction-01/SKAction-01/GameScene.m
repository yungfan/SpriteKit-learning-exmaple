//
//  GameScene.m
//  SKAction-01
//
//  Created by teacher on 17/3/7.
//  Copyright © 2017年 安徽商贸职业技术学院. All rights reserved.
//

#import "GameScene.h"

@interface GameScene()

@end

@implementation GameScene


#pragma mark - 添加两个精灵 一个是背景一个是飞机
-(void)didMoveToView:(SKView *)view{
    
    [super didMoveToView:view];
    
    [self backGroundNode];
    
    [self planeNode];
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

    
    NSLog(@"%s", __func__);

    //1 移动到某一点（x，y，坐标）
    SKAction *action = [SKAction moveByX:-100 y:100 duration:2.0];
    
    SKSpriteNode *actionNode = (SKSpriteNode *)[self childNodeWithName:@"plane"];
    
    [actionNode runAction:action];

}


@end
