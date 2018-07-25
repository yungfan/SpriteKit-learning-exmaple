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
    
    //设置场景的物理世界
    self.physicsWorld.gravity = CGVectorMake(0.0, 0.0);
    
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
    
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.view.frame];
    
    SKSpriteNode *plane = (SKSpriteNode *)[self childNodeWithName:@"plane"];
    plane.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:plane.size];
    plane.physicsBody.restitution = 0;
    
    //[plane.physicsBody applyForce:CGVectorMake(0, 1000)];
    
    //[plane.physicsBody applyTorque:1000.0];
    
    //[plane.physicsBody applyImpulse:CGVectorMake(0, 100)];
    
    //[plane.physicsBody applyAngularImpulse:200.0];

}

@end
