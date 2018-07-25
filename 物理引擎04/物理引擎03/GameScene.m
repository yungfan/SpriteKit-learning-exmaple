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
    
    
    SKSpriteNode *planeNode2 = [SKSpriteNode spriteNodeWithImageNamed:@"plane"];
    
    planeNode2.name = @"plane2";
    
    
    planeNode2.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 200);
    
    planeNode2.zPosition = 1;
    
    [self addChild:planeNode2];



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
    
    //给第一个飞机创建物理体
    SKSpriteNode *plane = (SKSpriteNode *)[self childNodeWithName:@"plane"];
    
    plane.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:plane.size];
    
    
    //给第二个飞机创建物理体
    SKSpriteNode *plane2 = (SKSpriteNode *)[self childNodeWithName:@"plane2"];
    
    plane2.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:plane2.size];

    
    //弹簧连接
//    SKPhysicsJointSpring *spring = [SKPhysicsJointSpring jointWithBodyA:plane.physicsBody bodyB:plane2.physicsBody anchorA:plane.position anchorB:plane2.position];
    
   SKPhysicsJointSliding *sliding = [SKPhysicsJointSliding jointWithBodyA:plane.physicsBody bodyB:plane2.physicsBody anchor:plane2.position axis:CGVectorMake(0, 160)];
    
    //弹簧的阻尼，阻尼越大，停下来越快
    //spring.damping  = 0.05;
    
    //弹簧的振动频率，频率越小，弹得次数越多
    //spring.frequency = 1.0;

    [self.physicsWorld addJoint:sliding];

}

@end
