//
//  Projectile.h
//  Slingshot
//
//  Created by Olle Lind on 09/11/14.
//  Copyright (c) 2014 Olle Lind. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "MovingObject.h"

@interface Projectile : MovingObject

@property (nonatomic,assign) double speed;
@property (nonatomic, assign) int durability;

-(id)initWithPosition:(CGPoint)position;
-(void)fireInDirection:(CGPoint)direction power:(double)power;

@end
