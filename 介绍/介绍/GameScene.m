//
//  GameScene.m
//  介绍
//
//  Created by teacher on 17/2/14.
//  Copyright (c) 2017年 安徽商贸职业技术学院. All rights reserved.
//

#import "GameScene.h"
#import "FirstScene.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
//    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
//    
//    myLabel.text = @"移动互联";
//    myLabel.fontSize = 45;
//    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
//                                   CGRectGetMidY(self.frame));
//    
//    [self addChild:myLabel];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
//    
//    for (UITouch *touch in touches) {
//        //获取你在屏幕点击的位置坐标
//        CGPoint location = [touch locationInNode:self];
//        
//        //创建一个飞机节点
//        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
//        
//        sprite.xScale = 0.1;
//        sprite.yScale = 0.1;
//        
//        sprite.position = location;
//        
////        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
////        
////        [sprite runAction:[SKAction repeatActionForever:action]];
//        
//        [self addChild:sprite];
    
    
        FirstScene *scene = [[FirstScene alloc]initWithSize:self.view.frame.size];
    
        SKTransition *transition = [SKTransition doorsOpenHorizontalWithDuration:3];
    
        [self.view presentScene:scene transition:transition];

//    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
