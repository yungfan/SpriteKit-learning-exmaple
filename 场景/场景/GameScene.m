//
//  GameScene.m
//  场景
//
//  Created by teacher on 17/2/20.
//  Copyright (c) 2017年 安徽商贸职业技术学院. All rights reserved.
//

#import "GameScene.h"
#import "FirstGameScene.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel.text = @"Hello, World!";
    myLabel.fontSize = 45;
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame));
    
    [self addChild:myLabel];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    
    //如果没有sks文件，不能调用nodeWithFileNamed方法来初始化一个场景
    FirstGameScene *firstGC = [[FirstGameScene alloc]initWithSize:CGSizeMake(100, 100)];
    
    
    SKTransition *transiton = [SKTransition doorsOpenVerticalWithDuration:3.0];

    
    //场景切换的过渡效果
    [self.view presentScene:firstGC  transition:transiton];
    
    
//    for (UITouch *touch in touches) {
//        CGPoint location = [touch locationInNode:self];
//        
//        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
//        
//        sprite.xScale = 0.5;
//        sprite.yScale = 0.5;
//        sprite.position = location;
//        
//        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
//        
//        [sprite runAction:[SKAction repeatActionForever:action]];
//        
//        [self addChild:sprite];
//    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
