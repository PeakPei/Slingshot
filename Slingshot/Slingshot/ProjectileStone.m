//
//  ProjectileStone.m
//  Slingshot
//
//  Created by Olle Lind on 09/11/14.
//  Copyright (c) 2014 Olle Lind. All rights reserved.
//

#import "ProjectileStone.h"

@implementation ProjectileStone

-(id)initWithPosition:(CGPoint)position{
    self = [self initWithImageNamed:@"stone"];
    if(self){
        self.position = position;
        self.speed = 25.0;
        [self configureCollisionBody];
    }
    return self;
}

- (void)configureCollisionBody {
    self.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.frame.size.width/2];
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.categoryBitMask = PhysicsProjectile;
    self.physicsBody.contactTestBitMask = PhysicsBadguy;
    self.physicsBody.collisionBitMask = 0;
}

@end
