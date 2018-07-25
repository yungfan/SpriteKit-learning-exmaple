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
    
    
    
    
    SKSpriteNode *plane2 = [SKSpriteNode spriteNodeWithImageNamed:@"plane"];

    plane2.name = @"plane2";
    
    plane2.position = CGPointMake(CGRectGetMidX(self.frame) + 100, CGRectGetMidY(self.frame));


    plane2.zPosition = 1;
    
    [self addChild:plane2];
    
    
    
    SKSpriteNode *plane3 = [SKSpriteNode spriteNodeWithImageNamed:@"plane"];
    
    plane3.name = @"plane3";
    
    plane3.position = CGPointMake(CGRectGetMidX(self.frame) - 100, CGRectGetMidY(self.frame));
    
    
    plane3.zPosition = 1;
    
    [self addChild:plane3];

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

    //默认SKAction的speed是1.0
    SKAction *action1 = [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame), 20) duration:3.0];
    SKAction *action2 = [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) + 100, 20) duration:3.0];
    SKAction *action3 = [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) - 100, 20) duration:3.0];

    
    //速度属性能够修改完成动作的速度 从而影响完成的整个流程
    //action1.speed = 0.2;
    //action2.speed = 3.0;
    
    
    //每个SKAction创建的时候都会设置一个duration，如果创建完成以后又修改了它的duration属性，那么会默认覆盖掉之前的
    //action2.duration = 5.0;
    
    //speed属性如果和duration同时设置，那么速度的优先级更大
    
    
    SKSpriteNode *plane1 = (SKSpriteNode *)[self childNodeWithName:@"plane"];
    SKSpriteNode *plane2 = (SKSpriteNode *)[self childNodeWithName:@"plane2"];
    SKSpriteNode *plane3 = (SKSpriteNode *)[self childNodeWithName:@"plane3"];
    
    
    
    
    //输出是1.0 -- 5.0
    // NSLog(@"%f -- %f", action1.duration, action2.duration);
    

    
    //曲线方式  1、抽奖的大转盘 先快后慢  2、雪花飘落  先慢后快  3、匀速

    //1
    action1.timingMode = SKActionTimingEaseIn;
    //2
    action3.timingMode = SKActionTimingEaseOut;
    
    action2.timingMode = SKActionTimingEaseInEaseOut;
    
    
    
    
    [plane1 runAction:action1];
    [plane2 runAction:action2];
    [plane3 runAction:action3];
}

@end
