//
//  GameScene.m
//  游戏
//
//  Created by teacher on 17/3/1.
//  Copyright (c) 2017年 安徽商贸职业技术学院. All rights reserved.
//

#import "GameScene.h"

@interface GameScene()

@property(nonatomic, strong) SKSpriteNode *sprite;
@end

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    
    SKSpriteNode *bg = [SKSpriteNode spriteNodeWithImageNamed:@"background_f0"];
    //bg.size = self.size;
    bg.position = CGPointZero;
    bg.anchorPoint = CGPointZero;
    [self addChild:bg];
    
    
    SKSpriteNode *panda = [SKSpriteNode spriteNodeWithImageNamed:@"panda_run_01"];
    panda.position = CGPointMake(100, CGRectGetMidY(self.frame));
   //panda.anchorPoint = CGPointMake(0.5, 0.5);
    [self addChild:panda];
    self.sprite = panda;
    
    
    SKSpriteNode *left = [SKSpriteNode spriteNodeWithImageNamed:@"platform_l"];
    left.position = CGPointMake(100, CGRectGetMidY(self.frame) - 80);
    left.anchorPoint = CGPointMake(0, 0.5);
    [self addChild:left];
    
    SKSpriteNode *middle = [SKSpriteNode spriteNodeWithImageNamed:@"platform_m"];
    middle.anchorPoint = CGPointMake(0, 0.5);
    middle.position = CGPointMake(100+102, CGRectGetMidY(self.frame) - 80);
    [self addChild:middle];
    
    SKSpriteNode *right = [SKSpriteNode spriteNodeWithImageNamed:@"platform_r"];
    right.position = CGPointMake(100+102+290, CGRectGetMidY(self.frame) - 80);
    right.anchorPoint = CGPointMake(0, 0.5);
    [self addChild:right];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    CGPoint lastPosition = self.sprite.position;
    
    
    
    
    if (lastPosition.x < self.size.width-100) {
        self.sprite.position = CGPointMake(lastPosition.x + 50, CGRectGetMidY(self.frame));
    } else{
        
        self.sprite.hidden = YES;
    
    }
    
    

}

@end
