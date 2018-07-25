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
    
    SKSpriteNode *planeNode = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
    
    //394 × 347
    planeNode.size = CGSizeMake(65, 55);
    
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
    
//    SKAction *action1 = [SKAction fadeOutWithDuration:2.0];
//    SKAction *action2 = [SKAction fadeInWithDuration:2.0];
//
//    SKAction *sequenceAction = [SKAction sequence:@[action1, action2]];
//    SKSpriteNode *plane = (SKSpriteNode *)[self childNodeWithName:@"plane"];
//    
//    //0-1之间
//    SKAction *action = [SKAction fadeAlphaTo:0.5 duration:2.0];
//    
//    
//    [plane runAction:action];
    
    
    
//    SKSpriteNode *plane = (SKSpriteNode *)[self childNodeWithName:@"plane"];
//    
//    //0-1之间
//    SKAction *action1 = [SKAction hide];
//    SKAction *action2 = [SKAction unhide];
//    SKAction *sequenceAction = [SKAction sequence:@[action1, action2]];
//    [plane runAction:sequenceAction];
    
    
        SKSpriteNode *plane = (SKSpriteNode *)[self childNodeWithName:@"plane"];
        SKAction *action = [SKAction resizeToWidth:260 height:230 duration:3.0];
    
        [plane runAction:action];
    
}

@end
