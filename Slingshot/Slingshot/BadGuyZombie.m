//
//  BadGuyZombie.m
//  Slingshot
//
//  Created by Olle Lind on 09/11/14.
//  Copyright (c) 2014 Olle Lind. All rights reserved.
//

#import "BadGuyZombie.h"

@implementation BadGuyZombie

-(id)initWithPosition:(CGPoint)position{
    self = [self initWithImageNamed:@"zombie1"];
    if(self){
        self.position = position;
        self.speed = 300.0;
        self.health = 3;
        [self configureCollisionBody];
        self.walkAnimation = [self loadAnimationNamed:@"zombie" frames:12 timePerFrame:15.0];
        self.zRotation = -M_PI/2;
    }
    return self;
}

-(SKAction *)loadAnimationNamed:(NSString *)name frames:(int)frames timePerFrame:(double)frameTime{
    NSMutableArray *textures = [NSMutableArray array];
    for(int i=1; i<=frames; i++){
        NSString *textureName = [NSString stringWithFormat:@"%@%d.png", name, i];
        SKTexture *texture = [SKTexture textureWithImageNamed:textureName];
        if(texture)
            [textures addObject:texture];
    }
    SKAction *animation = [SKAction animateWithTextures:[NSArray arrayWithArray:textures] timePerFrame:frameTime];
    return animation;
}

- (void)configureCollisionBody {
    //self.physicsBody = [SKPhysicsBody bodyWithTexture:self.texture size:self.texture.size];
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.dynamic = YES;
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.categoryBitMask = PhysicsBadguy;
    self.physicsBody.contactTestBitMask = PhysicsProjectile;
    self.physicsBody.collisionBitMask = 0;
    self.physicsBody.friction = 0.0;
    self.physicsBody.linearDamping = 0.0;
    
}

@end
