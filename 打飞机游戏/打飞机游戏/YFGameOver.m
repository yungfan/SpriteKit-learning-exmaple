//
//  YFGameOver.m
//  打飞机游戏
//
//  Created by teacher on 17/5/15.
//  Copyright © 2017年 安徽商贸职业技术学院. All rights reserved.
//

#import "YFGameOver.h"

@implementation YFGameOver

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
    
    SKLabelNode *end = [SKLabelNode labelNodeWithText:@"游戏结束"];
    end.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame) - 100);
    end.zPosition = 2;
    end.fontName = @"Marker Felt";
    end.fontColor = [SKColor colorWithRed:68/255.0 green:68/255.0 blue:68/255.0 alpha:1];
    end.fontSize = 30;
    [self addChild:end];
    
    SKLabelNode *restart = [SKLabelNode labelNodeWithText:@"重新开始"];
    restart.name = @"restart";
    restart.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    restart.zPosition = 2;
    restart.fontSize = 40;
    restart.fontName = @"AmericanTypewriter-Bold";
    restart.fontColor = [SKColor colorWithRed:68/255.0 green:68/255.0 blue:68/255.0 alpha:1];
    [self addChild:restart];
    
    SKLabelNode *score = [SKLabelNode labelNodeWithText:@"最后得分"];
    CGFloat y = (CGRectGetMidY(self.frame) - 100) * 0.5 + CGRectGetMidY(self.frame);
    score.position = CGPointMake(CGRectGetMidX(self.frame), y);
    score.zPosition = 2;
    score.fontSize = 35;
    score.fontName = @"Zapfino";
    score.fontColor = [SKColor colorWithRed:68/255.0 green:68/255.0 blue:68/255.0 alpha:1];
    [self addChild:score];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    UITouch *touch = [touches anyObject];
    
    CGPoint touchPoint = [touch locationInNode:self];
    
    SKLabelNode *reStart = (SKLabelNode *)[self nodeAtPoint:touchPoint];
    
    SKLabelNode *reStartNode = (SKLabelNode *) [self childNodeWithName:@"restart"];
    
    if (reStart == reStartNode) {
        
        YFGameOver *gameover = [[YFGameOver alloc]initWithSize:self.frame.size];
        
        [self.view presentScene:gameover transition:[SKTransition flipHorizontalWithDuration:2.0]];
        
    }
    
}


@end
