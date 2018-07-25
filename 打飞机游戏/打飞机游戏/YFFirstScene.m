//
//  YFFirstScene.m
//  打飞机游戏
//
//  Created by teacher on 17/5/10.
//  Copyright © 2017年 安徽商贸职业技术学院. All rights reserved.
//

#import "YFFirstScene.h"
#import "YFGame.h"


@implementation YFFirstScene

-(void)didMoveToView:(SKView *)view{
    
     [super didMoveToView:view];

    [self bgNode];
    
    [self bgText];

}

-(void)bgNode{

    SKSpriteNode *bg = [SKSpriteNode spriteNodeWithImageNamed:@"bg_02.jpg"];
    
    bg.zPosition = 1;
    
    bg.anchorPoint = CGPointMake(0, 0);
    
    bg.size = self.view.frame.size;
    
    [self addChild:bg];


}

-(void)bgText{
    
    SKLabelNode *gameName = [SKLabelNode labelNodeWithText:@"打飞机游戏"];
    gameName.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame) - 100);
    gameName.zPosition = 2;
    gameName.fontName = @"Marker Felt";
    gameName.fontColor = [SKColor colorWithRed:68/255.0 green:68/255.0 blue:68/255.0 alpha:1];
    gameName.fontSize = 28;
    [self addChild:gameName];

    SKLabelNode *start = [SKLabelNode labelNodeWithText:@"开始"];
    start.name = @"start";
    start.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    start.zPosition = 2;
    start.fontSize = 50;
    start.fontName = @"AmericanTypewriter-Bold";
    start.fontColor = [SKColor colorWithRed:68/255.0 green:68/255.0 blue:68/255.0 alpha:1];
    [self addChild:start];
    
    SKLabelNode *author = [SKLabelNode labelNodeWithText:@"ABC"];
    author.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMinY(self.frame) + 50);
    author.zPosition = 2;
    author.fontSize = 14;
    author.fontName = @"Zapfino";
    author.fontColor = [SKColor colorWithRed:68/255.0 green:68/255.0 blue:68/255.0 alpha:1];
    [self addChild:author];
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{


    UITouch *touch = [touches anyObject];
    
    CGPoint touchPoint = [touch locationInNode:self];

    SKLabelNode *start = (SKLabelNode *)[self nodeAtPoint:touchPoint];
    
    SKLabelNode *startNode = (SKLabelNode *) [self childNodeWithName:@"start"];
    
    if (start == startNode) {
        
        YFGame *game = [[YFGame alloc]initWithSize:self.frame.size];
        
        [self.view presentScene:game transition:[SKTransition flipHorizontalWithDuration:2.0]];
        
    }

}

@end
