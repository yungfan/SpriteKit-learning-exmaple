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
    

    //to是直接旋转到某个弧度 by在上一次的基础之上再次旋转一个弧度
//    SKAction *rotateAction = [SKAction rotateByAngle:M_PI_2 duration:1.0];
//    
//    SKSpriteNode *plane = (SKSpriteNode *)[self childNodeWithName:@"plane"];
//    
//    [plane runAction:rotateAction];
    
    
    CGPathRef path = CGPathCreateWithRect(CGRectMake(0, 0, 100, 100), nil);
    
    
    //asOffset 参考坐标系 如果为YES 是以精灵自己的坐标系来考量 如果是NO 以父坐标系来考量
    //frame bounds  View - subViews
    //orientToPath 精灵的方向是否跟着路径的方向改变而改变（是否与路径方向保持一致）
    SKAction *pathAction = [SKAction followPath:path asOffset:YES orientToPath:NO duration:2.0];
    
    SKSpriteNode *plane = (SKSpriteNode *)[self childNodeWithName:@"plane"];
    
    [plane runAction:pathAction];
    
}



@end
