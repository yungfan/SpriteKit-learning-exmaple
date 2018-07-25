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
    
    [self plane2Node];


}


-(void)planeNode{
    
    SKSpriteNode *planeNode = [SKSpriteNode spriteNodeWithImageNamed:@"plane"];
    
    planeNode.name = @"plane";
    
    
    planeNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));

    planeNode.zPosition = 1;
    
    [self addChild:planeNode];


}


-(void)plane2Node{
    
    SKSpriteNode *planeNode = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
    
    planeNode.name = @"plane2";
    
    planeNode.size = CGSizeMake(100, 100);
    
    planeNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 200);
    
    planeNode.zPosition = 2;
    
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
    
    SKSpriteNode *planeNode = (SKSpriteNode *)[self childNodeWithName:@"plane"];
    
    SKSpriteNode *plane2Node = (SKSpriteNode *)[self childNodeWithName:@"plane"];
    
    SKAction *customAction1 = [SKAction customActionWithDuration:2.0 actionBlock:^(SKNode * _Nonnull node, CGFloat elapsedTime) {
        
        //随着时间推移，elapsedTime 一直在［0，duration］之间变化
        
        //actionBlock中的node就是上面飞机那个精灵
        
        NSLog(@"%f", elapsedTime);
        
        NSLog(@"%d", planeNode == node);
        
        //自定义的动作
        SKSpriteNode *plane= (SKSpriteNode *)node;
        plane.position = CGPointMake(self.view.center.x + 100, self.view.center.y + 100);

        
    }];
    
    SKAction *customAction2 = [SKAction customActionWithDuration:2.0 actionBlock:^(SKNode * _Nonnull node, CGFloat elapsedTime) {
        
        //自定义的动作
        SKSpriteNode *plane= (SKSpriteNode *)node;
        plane.position = CGPointMake(self.view.center.x - 100, self.view.center.y + 100);
        
        
        
    }];
    
    SKAction *customAction3 = [SKAction customActionWithDuration:2.0 actionBlock:^(SKNode * _Nonnull node, CGFloat elapsedTime) {
        
         SKSpriteNode *plane= (SKSpriteNode *)node;
         plane.position = self.view.center;
        
        
        
    }];
    
    
    SKAction *sequenceAction = [SKAction sequence:@[customAction1, customAction2, customAction3]];
    
    [planeNode runAction:sequenceAction];
}

@end
