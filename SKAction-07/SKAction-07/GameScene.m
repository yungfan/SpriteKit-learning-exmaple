//
//  GameScene.m
//  动作准备
//
//  Created by teacher on 17/3/8.
//  Copyright © 2017年 安徽商贸职业技术学院. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene


-(void)didMoveToView:(SKView *)view{

    [super didMoveToView:view];
    
    [self bgNode];
    
    [self planeNode];


}


-(void)planeNode{
    
    SKSpriteNode *planeNode = [SKSpriteNode spriteNodeWithImageNamed:@"plane"];
    
    planeNode.name = @"plane";
    
    
    planeNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));

    planeNode.zPosition = 1;
    
    [self addChild:planeNode];


}

-(void)bgNode{
    
    SKSpriteNode *bgNode = [SKSpriteNode spriteNodeWithImageNamed:@"bg.jpg"];
    
    bgNode.size = self.size;
    
    bgNode.position = CGPointZero;
    
    bgNode.anchorPoint = CGPointZero;
    
    bgNode.zPosition = 0;

    [self addChild:bgNode];
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    SKSpriteNode *plane = (SKSpriteNode *)[self childNodeWithName:@"plane"];
//    
//    SKAction *action1 = [SKAction colorizeWithColorBlendFactor:0.5 duration:2.0];
//    
//    [plane runAction:action1];
    
    
        SKSpriteNode *plane = (SKSpriteNode *)[self childNodeWithName:@"plane"];
    
        SKAction *action2 = [SKAction colorizeWithColor:[UIColor cyanColor] colorBlendFactor:0.2 duration:2.0];
    
    
        //第二个参数值越大 反而执行的速度越快  值越小反而越慢
        SKAction *action3 = [SKAction waitForDuration:2.0 withRange:1.0];
    
        SKAction *action4 = [SKAction removeFromParent];
    
        SKAction *sequnceAction = [SKAction sequence:@[action3, action2, action4]];
    
        [plane runAction:sequnceAction];
    
}

@end
