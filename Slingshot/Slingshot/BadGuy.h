//
//  BadGuy.h
//  Slingshot
//
//  Created by Olle Lind on 09/11/14.
//  Copyright (c) 2014 Olle Lind. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "MovingObject.h"

@interface BadGuy : MovingObject

@property (nonatomic, assign) double speed;
@property (nonatomic, assign) double health;
@property (nonatomic, strong) SKAction *walkAnimation;

-(id)initWithPosition:(CGPoint)position;
-(void)attack;

@end
