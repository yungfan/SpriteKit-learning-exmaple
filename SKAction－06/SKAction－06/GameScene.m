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
    
    
//    SKAction *action1 = [SKAction resizeToWidth:200 duration:2.0];
//    
//    
//    SKSpriteNode *plane = (SKSpriteNode *)[self childNodeWithName:@"plane"];
//    
//    
//    [plane runAction:action1];
    
//    SKAction *action2 = [SKAction resizeToHeight:200 duration:2.0];
//    
//    
//    SKSpriteNode *plane = (SKSpriteNode *)[self childNodeWithName:@"plane"];
//    
//    
//    [plane runAction:action2];
    
//    SKAction *action3 = [SKAction resizeByWidth:20 height:20 duration:2.0];
//    
//    
//    SKSpriteNode *plane = (SKSpriteNode *)[self childNodeWithName:@"plane"];
//    
//    
//    [plane runAction:action3];

    
    //scale 放大或者缩小多少倍 （大于1的放大 小于1的缩小）
//    SKAction *action4 = [SKAction scaleXTo:0.5 y:0.5 duration:2.0];
//
//    SKSpriteNode *plane = (SKSpriteNode *)[self childNodeWithName:@"plane"];
//
//    [plane runAction:action4];
    
//    
//       SKAction *action5 = [SKAction scaleXBy:0.5 y:0.5 duration:2.0];
//    
//       SKSpriteNode *plane = (SKSpriteNode *)[self childNodeWithName:@"plane"];
//    
//      [plane runAction:action5];
    
//        SKAction *action6 = [SKAction scaleTo:0.5 duration:2.0];
//    
//        SKSpriteNode *plane = (SKSpriteNode *)[self childNodeWithName:@"plane"];
//    
//        [plane runAction:action6];
    
//            SKAction *action7 = [SKAction scaleBy:0.5 duration:2.0];
//    
//            SKSpriteNode *plane = (SKSpriteNode *)[self childNodeWithName:@"plane"];
//    
//            [plane runAction:action7];
    
    
//           SKAction *action8 = [SKAction scaleXTo:0.5 duration:2.0];
//    
//           SKSpriteNode *plane = (SKSpriteNode *)[self childNodeWithName:@"plane"];
//    
//           [plane runAction:action8];
    

}

@end
