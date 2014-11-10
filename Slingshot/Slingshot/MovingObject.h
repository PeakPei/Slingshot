//
//  MovingObject.h
//  Slingshot
//
//  Created by Olle Lind on 09/11/14.
//  Copyright (c) 2014 Olle Lind. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

typedef NS_OPTIONS(uint32_t, CollisionType) {
    PhysicsProjectile       =1 << 0,
    PhysicsBadguy           =1 << 1,
    PhysicsBorders          =1 << 2,
};

@interface MovingObject : SKSpriteNode

- (void)collidedWith:(SKPhysicsBody *)body contact:(SKPhysicsContact *)contact;

@end
