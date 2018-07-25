//
//  FirstScene.m
//  介绍
//
//  Created by teacher on 17/2/14.
//  Copyright © 2017年 安徽商贸职业技术学院. All rights reserved.
//

#import "FirstScene.h"

@implementation FirstScene

-(instancetype)initWithSize:(CGSize)size{
    
    if (self = [super initWithSize:size]) {
        
        self.backgroundColor = [SKColor redColor];
        
    }

    return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    for (UITouch *touch in touches) {
         CGPoint location = [touch locationInNode:self];
         SKSpriteNode *node = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(20, 20)];
        
        node.position = location;
        
        [self addChild:node];
    }

    
    


}

@end
