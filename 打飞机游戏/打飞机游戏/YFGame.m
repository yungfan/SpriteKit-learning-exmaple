//
//  YFGame.m
//  打飞机游戏
//
//  Created by teacher on 17/5/17.
//  Copyright © 2017年 安徽商贸职业技术学院. All rights reserved.
//

#import "YFGame.h"
#import "YFGameOver.h"

#define EnemyScore 200

@interface YFGame() <SKPhysicsContactDelegate>

@property(nonatomic, assign) int score;

@property(nonatomic, assign) BOOL isPlane;

@property(nonatomic, strong) SKSpriteNode *plane;


@property(nonatomic ,assign) NSTimeInterval previousTime;

@end


@implementation YFGame


// 设置基本参数
-(instancetype)initWithSize:(CGSize)size{
    
    if (self = [super initWithSize:size]) {
        
        self.physicsWorld.gravity = CGVectorMake(0.0, 0.0);
        
        self.physicsWorld.contactDelegate = self;
        
    }
    
    return self;
}

-(void)didMoveToView:(SKView *)view{

    [super didMoveToView:view];
    

    
    self.previousTime = 0;
    
    self.score = 0;
    
    [self bgNode];

    [self planeNode];
    
    [self scoreText];
    
    [self addPanGestureRecognizer];


}


/**
 *  子弹
 */
-(void)buletNode{

    SKSpriteNode *bulet = [SKSpriteNode spriteNodeWithImageNamed:@"飞机子弹"];
    
    bulet.position = CGPointMake(self.plane.position.x, self.plane.position.y + self.plane.size.height);
    
    bulet.zPosition = 2;
    
    [self addChild:bulet];
    
    //动作
    SKAction *shoot = [SKAction playSoundFileNamed:@"shoot.mp3" waitForCompletion:NO];
    
    SKAction *moveAction = [SKAction moveTo:CGPointMake(self.plane.position.x, CGRectGetMaxY(self.frame)) duration:2.0];

    
    SKAction *group = [SKAction group:@[shoot, moveAction]];
    
    [bulet runAction:group completion:^{
        [bulet removeFromParent];
    }];
    
    //物理引擎  由于敌机有可能跟子弹和飞机发生碰撞 又不能设置两个contactTestBitMask 怎么办？主要看自己主动想和谁碰撞 明显是子弹
    bulet.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:bulet.size];
    
    bulet.physicsBody.dynamic = YES;
    
    bulet.physicsBody.categoryBitMask = 2;
    
    bulet.physicsBody.contactTestBitMask = 1;
    
}

/**
 *  敌机
 */
-(void)enemyNode{

    
    SKSpriteNode *enemy = [SKSpriteNode spriteNodeWithImageNamed:@"敌人1"];
    
    //取值范围
    int x = (int)(CGRectGetMaxX(self.frame) - enemy.size.width);
    
    //随机产生一个数 (0, 屏幕最大值)
    int random = arc4random() % x + enemy.size.width * 0.5;
    
    enemy.position = CGPointMake(random , CGRectGetMaxY(self.frame));
                                 
    enemy.anchorPoint = CGPointMake(0.5, 1);
    
    enemy.zPosition = 2;
    
    [self addChild:enemy];
                                 

    //动作
    SKAction *action = [SKAction moveTo:CGPointMake(random, 0) duration:2];
    
    [enemy runAction:action completion:^{
        [enemy removeFromParent];
    }];
    
    //物理引擎
    enemy.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:enemy.size];
    
    enemy.physicsBody.dynamic = YES;
    
    enemy.physicsBody.categoryBitMask = 1;
    
    enemy.physicsBody.contactTestBitMask = 2;


}

-(void)addPanGestureRecognizer{
    //创建手势进行拖动
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    
    [self.view addGestureRecognizer:pan];

}


-(void)panAction:(UIPanGestureRecognizer *)sender{
    
    if (self.isPlane) {
        
        SKSpriteNode *plane = (SKSpriteNode *)[self childNodeWithName:@"plane"];
        
        CGPoint position = [sender locationInView:sender.view];
        
        position = CGPointMake(position.x, self.size.height -position.y);//因为坐标系不同,所以我们要进行转换..
        
        plane.position = position;
        
    }
}

/**
 *  背景
 */
-(void)bgNode{
    
    SKSpriteNode *bg = [SKSpriteNode spriteNodeWithImageNamed:@"bg_02.jpg"];
    
    bg.zPosition = 1;
    
    bg.anchorPoint = CGPointMake(0, 0);
    
    bg.size = self.view.frame.size;
    
    [self addChild:bg];
    
    
}

/**
 *  主机
 */
-(void)planeNode{

    SKSpriteNode *plane = [SKSpriteNode spriteNodeWithImageNamed:@"飞机"];

    plane.name = @"plane";
    
    plane.position = CGPointMake(CGRectGetMidX(self.frame), 0);
    
    plane.anchorPoint = CGPointMake(0.5, 0);
    
    plane.zPosition = 2;
    
    [self addChild:plane];
    
    
    //动作
    NSMutableArray *textures = [NSMutableArray array];
    
    SKTexture *texture1 = [SKTexture textureWithImage:[UIImage imageNamed:@"飞机动画1"]];
    SKTexture *texture2 = [SKTexture textureWithImage:[UIImage imageNamed:@"飞机动画2"]];
    
    [textures addObject:texture1];
    [textures addObject:texture2];
    
    
    SKAction *basicAction = [SKAction animateWithTextures:textures timePerFrame:0.1];
    
    SKAction *action = [SKAction repeatActionForever:basicAction];
    
    [plane runAction:action];
    
    //物理引擎
    plane.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:plane.size];
    
    plane.physicsBody.dynamic = YES;
    
    plane.physicsBody.categoryBitMask = 0;
    
    plane.physicsBody.contactTestBitMask = 1;
    
    
    self.plane = plane;
    
    
    
    

}

/**
 *  显示的数据
 */
-(void)scoreText{
    
    NSString *str = [NSString stringWithFormat:@"得分%d", self.score];
    SKLabelNode *score = [SKLabelNode labelNodeWithText:str];
    score.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    score.name = @"score";
    score.position = CGPointMake(CGRectGetMinX(self.frame) + 30, CGRectGetMaxY(self.frame) - 30);
    score.zPosition = 2;
    score.fontColor = [SKColor colorWithRed:68/255.0 green:68/255.0 blue:68/255.0 alpha:1];
    score.fontSize = 20;
    [self addChild:score];

}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    self.isPlane = NO;//每一次触摸方法调用isPlane的值都为NO.
    
    UITouch *touch = [touches anyObject];
    
    CGPoint  position = [touch locationInNode:self];
    
    SKNode *node = [self nodeAtPoint:position];
    
    if ([node.name isEqualToString:@"plane"]) {
        
        self.isPlane = YES;//如果是需要拖动的SKSpriteNode对象,那么isPlane的值为YES.
        
    }

}

//当打中敌机以后 分数值要加
-(void)setScore{

    self.score ++;
    
    SKLabelNode *score = (SKLabelNode *)[self childNodeWithName:@"score"];
    
    int result = self.score * EnemyScore;
    
    NSString *str = [NSString stringWithFormat:@"得分%d", result];
    
    score.text = str;

}

/**
 *  界面更新
 *
 *  @param currentTime <#currentTime description#>
 */
-(void)update:(NSTimeInterval)currentTime{

//    //第一次进来 将当前时间赋值给previousTime
//    if (self.previousTime == 0) {
//        
//        self.previousTime = currentTime;
//        
//        return;
//        
//    }
//    
//    //计算当前时间与上一次时间的差值
//    NSTimeInterval delta =  currentTime - self.previousTime;
//    
//    //如果差值大于0.8秒 执行发子弹 敌机出现
//    if (delta > 0.8) {
//        
//        [self enemyNode];
//
//        [self buletNode];
//        
//        //覆盖掉上一次的时间
//        self.previousTime = currentTime;
//
//    }
    
    if(currentTime-self.previousTime > 0.8){
        
        [self enemyNode];
        
        [self buletNode];
        
        self.previousTime = currentTime;
        
    }


    
}

/**
 *  碰撞开始
 *
 */
- (void)didBeginContact:(SKPhysicsContact *)contact{
    
    //到底是谁碰谁？ 效果都是发生爆炸 （谁来执行这个动画的问题）
    
    
    //判断一下碰撞的主体是不是飞机和敌机
    //bodyA:主动撞的主体
    //bodyB:被撞的主体
    
    //子弹撞飞机
    if(contact.bodyA.categoryBitMask == 2 && contact.bodyB.categoryBitMask == 1){
        
        [self explosion:contact];
        
        
    }
    
    //飞机撞子弹
    if(contact.bodyA.categoryBitMask == 1 && contact.bodyB.categoryBitMask == 2){
        
        [self explosion:contact];
        
    }
    
    if(contact.bodyA.categoryBitMask == 0 && contact.bodyB.categoryBitMask == 1){
        
        
        YFGameOver *gameover = [[YFGameOver alloc]initWithSize:self.view.frame.size];
        
        [self.view presentScene:gameover transition:[SKTransition doorwayWithDuration:1.0]];
        
    
    
    }

    
    
            
}

-(void)explosion:(SKPhysicsContact *)contact{


    //检测不论是子弹先撞敌机 还是敌机碰子弹 都需要执行爆炸效果并且都消失于屏幕
    
    SKAction *music = [SKAction playSoundFileNamed:@"explosion.mp3" waitForCompletion:NO];
    
    NSMutableArray *textures = [NSMutableArray array];
    
    SKTexture *texture = [SKTexture textureWithImage:[UIImage imageNamed:@"爆炸效果"]];
    
    [textures addObject:texture];
    
    
    SKAction *basicAction = [SKAction animateWithTextures:textures timePerFrame:0.2];
    
    SKAction *group = [SKAction group:@[basicAction, music]];
    
    [contact.bodyA.node runAction:group completion:^{
        
        [contact.bodyA.node removeFromParent];
        
        [contact.bodyB.node removeFromParent];
        
    }];
    
    [self setScore];


}



/**
 *  碰撞结束
 *
 */
- (void)didEndContact:(SKPhysicsContact *)contact{
    NSLog(@"%s", __func__);

}


@end
