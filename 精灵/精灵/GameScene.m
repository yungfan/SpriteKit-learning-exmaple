//
//  GameScene.m
//  精灵
//
//  Created by teacher on 17/2/27.
//  Copyright (c) 2017年 安徽商贸职业技术学院. All rights reserved.
//

#import "GameScene.h"

@interface GameScene()

@property(nonatomic, strong) SKLabelNode *labelNode;
@property(nonatomic, assign) int count;

@end

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
    
    //显示文本的节点类
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel.text = @"eat 0 Apple";
    myLabel.fontSize = 45;
   
    myLabel.fontColor = [UIColor redColor];
    
    myLabel.position = CGPointMake(100,CGRectGetMaxY(self.frame)-150);
    
    myLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    
    [self addChild:myLabel];
    
    self.labelNode = myLabel;
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
//    self.count++;
//    
//    NSString *str = [NSString stringWithFormat:@"eat %d Apple", self.count];
//    
//   self.labelNode.text = str;
    
    
    //显示文本的节点类
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel.text = @"Game Over";
    myLabel.fontSize = 60;
    
    myLabel.fontColor = [UIColor greenColor];
    
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
    
    
    [self addChild:myLabel];
    
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
