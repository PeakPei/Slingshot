//
//  Projectile.m
//  Slingshot
//
//  Created by Olle Lind on 09/11/14.
//  Copyright (c) 2014 Olle Lind. All rights reserved.
//

#import "Projectile.h"

@implementation Projectile

-(id)initWithPosition:(CGPoint)position{
    return nil;
}

-(void)fireInDirection:(CGPoint)direction power:(double)power{
    [self.physicsBody applyForce:CGVectorMake(direction.x*power, direction.y*power)];
}

-(void)collidedWith:(SKPhysicsBody *)body contact:(SKPhysicsContact *)contact{
    self.durability --;
    if(self.durability <= 0){
        [self runAction:[SKAction removeFromParent]];
    }
}
@end
