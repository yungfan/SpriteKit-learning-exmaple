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
    
    
    self.physicsWorld.contactDelegate = self;
    
    [self bgNode];
    
    [self planeNode];


}


-(void)planeNode{
    
    SKSpriteNode *planeNode = [SKSpriteNode spriteNodeWithImageNamed:@"plane"];
    
    planeNode.name = @"plane";
    
    //中心点，y值减100
    planeNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 100);

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
    
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.view.frame];
    
    //添加敌机
    SKSpriteNode *enemy = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
    
    enemy.size = CGSizeMake(30, 30);
    
    enemy.position =  CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame));
    
   // enemy.anchorPoint = CGPointMake(0.5, 1);
    
    enemy.zPosition = 1;
    
    [self addChild:enemy];
    
    [enemy runAction:[SKAction moveToY:20 duration:2.0]];
    
    
    //给飞机和敌机添加物理体
    enemy.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:enemy.size];
    
    enemy.physicsBody.categoryBitMask = 2;
    
    enemy.physicsBody.contactTestBitMask = 1;
    
    SKSpriteNode *plane = (SKSpriteNode *)[self childNodeWithName:@"plane"];
    
    SKPhysicsBody *planePhysicsBody = [SKPhysicsBody bodyWithRectangleOfSize:plane.size];
    
    planePhysicsBody.affectedByGravity = NO;
    
    plane.physicsBody = planePhysicsBody;
    
    plane.physicsBody.categoryBitMask = 1;
    
    plane.physicsBody.contactTestBitMask = 2;
}


#pragma mark - 碰撞协议，碰撞开始的方法
- (void)didBeginContact:(SKPhysicsContact *)contact{
    
    //判断一下碰撞的主体是不是飞机和敌机
    //bodyA:主动撞的主体
    //bodyB:被撞的主体
    if(contact.bodyA.categoryBitMask == 2 && contact.bodyB.categoryBitMask == 1)
    {
        
        SKSpriteNode *enemy = (SKSpriteNode *)[contact.bodyA node];
        
        [enemy removeFromParent];
        
        NSLog(@"%@", NSStringFromCGPoint(contact.contactPoint));
        
    }

    
    NSLog(@"%s", __func__);
    
}


#pragma mark - 碰撞协议，碰撞结束的方法
- (void)didEndContact:(SKPhysicsContact *)contact{
    
    NSLog(@"%s", __func__);
    
   

}

@end
