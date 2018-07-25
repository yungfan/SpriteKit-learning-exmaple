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


//播放音乐
//游戏引擎：1、将音乐看成一个动作 让一个精灵来执行动作 2、将音乐看成一个结点 让音乐结点执行播放、暂停、结束等动作
//iOS：多媒体知识中关于音乐部分的所有知识点皆可用于游戏
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    
    //1、第一种
    
//    NSString *musicName = [NSString stringWithFormat:@"%d.mp3", arc4random()%2];
//    
//    
//    SKAction *musicAction = [SKAction playSoundFileNamed:musicName waitForCompletion:YES];
//    
//    
//    CGPathRef path = CGPathCreateWithRect(CGRectMake(0, 0, 100, 100), nil);
//    
//    
//    SKAction *pathAction = [SKAction followPath:path duration:2.0];
//    
//    
//    SKSpriteNode *plane = (SKSpriteNode *)[self childNodeWithName:@"plane"];
//    
//    
//    [plane runAction:[SKAction playSoundFileNamed:@"ddz.mp3" waitForCompletion:YES]];
//    
//    
//    SKAction *seq = [SKAction sequence:@[pathAction, musicAction]];
//    
//    
//    [plane runAction:seq];
//    
    
    
    //2、第二种
    
    SKAudioNode *bgm =  [[SKAudioNode alloc]initWithFileNamed:@"ddz.mp3"];
    
    bgm.autoplayLooped  = NO;
    
    [self addChild:bgm];
    
    SKAction *action =  [SKAction play];
    
    [bgm runAction:action];
}

@end
