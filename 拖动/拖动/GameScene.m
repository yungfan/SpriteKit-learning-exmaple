//
//  GameScene.m
//  动作准备
//
//  Created by teacher on 17/3/8.
//  Copyright © 2017年 安徽商贸职业技术学院. All rights reserved.
//

#import "GameScene.h"

@interface GameScene()

@property(nonatomic, assign) BOOL isPlane;
@end

@implementation GameScene


-(void)didMoveToView:(SKView *)view{

    [super didMoveToView:view];
    
    [self bgNode];
    
    [self planeNode];
    
    //给当前的view添加一个拖动手势

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];

    
    [self.view addGestureRecognizer:pan];
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


-(void)pan:(UIPanGestureRecognizer *) pan{
    
   
    if (self.isPlane) {
        
         SKSpriteNode *plane = (SKSpriteNode *)[self childNodeWithName:@"plane"];
        
         CGPoint panPostion = [pan locationInView:self.view];
        
        
         plane.position = CGPointMake(panPostion.x, self.view.frame.size.height - panPostion.y);
        
    }


}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
     //判断点击的是不是飞机的位置，如果是才可以拖动飞机，否则不拖动
    
    self.isPlane = NO;

    UITouch *touch = [touches anyObject];
    
    CGPoint touchPositon = [touch locationInNode:self];
    
//    SKSpriteNode *plane = (SKSpriteNode *)[self childNodeWithName:@"plane"];
    
    
    //这种方式必须保证点击的位置 正好是精灵的正中央 要求太高
//    NSLog(@"%f-%f *** %f-%f",plane.position.x,touchPositon.x,  plane.position.y, touchPositon.y);
//    
//    if(plane.position.x == touchPositon.x && plane.position.y == touchPositon.y){
//        
//        NSLog(@"%s", __func__);
//    
//        self.isPlane = YES;
//    
//    }
    
    
    //通过这种方式，只要点击的位置在精灵的图片范围之内 都可以响应
     SKSpriteNode *plane =  (SKSpriteNode *)[self nodeAtPoint:touchPositon];

     if([plane.name isEqualToString:@"plane"]){
    
       self.isPlane = YES;
    
    }
    
}

@end
