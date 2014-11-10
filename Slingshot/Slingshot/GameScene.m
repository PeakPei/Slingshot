//
//  GameScene.m
//  Slingshot
//
//  Created by Olle Lind on 09/11/14.
//  Copyright (c) 2014 Olle Lind. All rights reserved.
//

#import "GameScene.h"
#import "Slingshot.h"
#import "MovingObject.h"
#import "BadGuyZombie.h"
#import "SKButton.h"
#import "WaveHandler.h"

@implementation GameScene{
    Slingshot *slingshot;
    SKShapeNode *node;
}

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    [WaveHandler handler].gameScene = self;
    [self addBackground];
    [self configurePhysics];
    slingshot = [[Slingshot alloc] initWithPosition:CGPointMake(screenSize.width/2, 200)];
    [self addChild:slingshot];
    
    
    SKButton *backButton = [[SKButton alloc] initWithImageNamedNormal:@"ship" selected:@"ship"];
    [backButton setPosition:CGPointMake(screenSize.width-75, 100)];
    [backButton setTouchUpInsideTarget:self action:@selector(buttonPressed)];
    [self addChild:backButton];
    
    [[WaveHandler handler] startWave];
}
-(void)buttonPressed{
    [slingshot shoot];
}

-(void)configurePhysics{
    self.physicsWorld.gravity = CGVectorMake(0, 0);
    self.physicsWorld.contactDelegate = self;
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    self.physicsBody.categoryBitMask = PhysicsBorders;
    self.physicsBody.friction = 0.0f;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    //UITouch *touch = [touches anyObject];
    //CGPoint touchPoint = [touch locationInNode:self];
    /*if(CGRectContainsPoint(slingshot.frame, touchPoint)){
        [slingshot touchesBegan:touches withEvent:event];
    }
    int X = arc4random()%(int)screenSize.width;
    BadGuyZombie *zombie = [[BadGuyZombie alloc]initWithPosition:CGPointMake(X, screenSize.height)];
    [self addChild:zombie];
    [zombie.physicsBody applyForce:CGVectorMake(0.0f, -zombie.speed)];*/

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInNode:self];
    double distance = [self distanceBetweenPoint:touchPoint andPoint:slingshot.position];
    if(distance < 200){
        [slingshot touchesMoved:touches withEvent:event];
    }
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    //[slingshot touchesEnded:touches withEvent:event];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    [[WaveHandler handler] update:currentTime];
}
-(double)distanceBetweenPoint:(CGPoint)point1 andPoint:(CGPoint)point2{
    double deltaX = point1.x-point2.x;
    double deltaY = point1.y-point2.y;
    return sqrt(powf(deltaX, 2) + powf(deltaY, 2));
}

-(void)addBackground{
    CGSize coverageSize = CGSizeMake(screenSize.width*2,screenSize.height*2); //the size of the entire image you want tiled
    CGRect textureSize = CGRectMake(0, 0, 25, 25); //the size of the tile.
    CGImageRef backgroundCGImage = [UIImage imageNamed:@"gras"].CGImage; //change the string to your image name
    UIGraphicsBeginImageContext(CGSizeMake(coverageSize.width, coverageSize.height));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawTiledImage(context, textureSize, backgroundCGImage);
    UIImage *tiledBackground = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    SKTexture *backgroundTexture = [SKTexture textureWithCGImage:tiledBackground.CGImage];
    SKSpriteNode *backgroundTiles = [SKSpriteNode spriteNodeWithTexture:backgroundTexture];
    backgroundTiles.yScale = -1; //upon closer inspection, I noticed my source tile was flipped vertically, so this just flipped it back.
    backgroundTiles.position = CGPointMake(0,0);
    backgroundTiles.zPosition = -1;
    [self addChild:backgroundTiles];
}

#pragma mark -
#pragma mark Physics Delegate

- (void)didBeginContact:(SKPhysicsContact *)contact {
    
    
    SKNode *contactNode = contact.bodyA.node;
    if([contactNode isKindOfClass:[MovingObject class]]) {
        [(MovingObject *)contactNode collidedWith:contact.bodyB contact:contact];
    }
    contactNode = contact.bodyB.node;
    if([contactNode isKindOfClass:[MovingObject class]]) {
        [(MovingObject *)contactNode collidedWith:contact.bodyA contact:contact];
    }
}

@end
