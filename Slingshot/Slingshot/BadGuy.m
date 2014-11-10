//
//  BadGuy.m
//  Slingshot
//
//  Created by Olle Lind on 09/11/14.
//  Copyright (c) 2014 Olle Lind. All rights reserved.
//

#import "BadGuy.h"

@implementation BadGuy

-(id)initWithPosition:(CGPoint)position{
    NSLog(@"UH OH!");
    return nil;
}

-(void)collidedWith:(SKPhysicsBody *)body contact:(SKPhysicsContact *)contact{
    self.health--;
    if(self.health <= 0){
        [self runAction:[SKAction removeFromParent]];
    }
}

-(void)attack{
    [self.physicsBody applyForce:CGVectorMake(0.0f, -self.speed)];
    if(self.walkAnimation){
        [self runAction:[SKAction repeatActionForever:self.walkAnimation]];
    }
}

@end
