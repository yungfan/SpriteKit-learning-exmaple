//
//  GameScene.m
//  纹理集
//
//  Created by teacher on 17/3/2.
//  Copyright (c) 2017年 安徽商贸职业技术学院. All rights reserved.
//

#import "GameScene.h"

@interface GameScene()

@property(nonatomic, strong) NSMutableArray *pandaTextures;

@property(nonatomic, strong) SKSpriteNode *panda;

@end

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    
    
    NSMutableArray *array = [NSMutableArray array];
    
    SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"panda"];
    
    NSArray *names = [atlas textureNames];
    
    for (int i = 1 ; i<=names.count; i++) {
        
        NSString *textureName = [NSString stringWithFormat:@"panda_run_0%d.png", i];
        
        //从纹理集中通过名称获取纹理
        SKTexture *texture = [atlas textureNamed:textureName];
        
        [array addObject:texture];
        
    }
    
    self.pandaTextures = array;
    
    self.panda = [SKSpriteNode spriteNodeWithTexture:[array objectAtIndex:7]];
    
    self.panda.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    
    
    [self addChild:self.panda];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
    SKAction *action = [SKAction animateWithTextures:self.pandaTextures timePerFrame:0.05];
    
    [self.panda runAction:[SKAction repeatActionForever:action]];

}


@end
