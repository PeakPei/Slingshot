//
//  Slingshot.m
//  Slingshot
//
//  Created by Olle Lind on 09/11/14.
//  Copyright (c) 2014 Olle Lind. All rights reserved.
//

#import "Slingshot.h"
#import "ProjectileStone.h"

@implementation Slingshot{
    BOOL dragging;
    CGPoint dragginPoint;
}


-(id)initWithPosition:(CGPoint)position{
    self = [self initWithImageNamed:@"slingshot"];
    if(self){
        self.position = position;
    }
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    dragging = YES;
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInNode:self.parent];
    double deltaX = self.position.x-touchPoint.x;
    double deltaY = self.position.y-touchPoint.y;
    double angle = -atan2(deltaX, deltaY);
    double distance = sqrt(powf(deltaX, 2) + powf(deltaY, 2));
    dragginPoint = CGPointMake(deltaX/distance, deltaY/distance);
    self.zRotation = angle+M_PI/2;

}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if(dragging){
        dragging = NO;
        UITouch *touch = [touches anyObject];
        CGPoint touchPoint = [touch locationInNode:self.parent];
        double deltaX = self.position.x-touchPoint.x;
        double deltaY = self.position.y-touchPoint.y;
        double distance = sqrt(powf(deltaX, 2) + powf(deltaY, 2));
        
        [self shootFromPoint:CGPointMake(deltaX/distance, deltaY/distance) withPower:distance];
    }
}

-(void)shootFromPoint:(CGPoint)point withPower:(double)power{
    ProjectileStone *projectile = [[ProjectileStone alloc]initWithPosition:self.position];
    [self.parent addChild:projectile];
    [projectile fireInDirection:point power:power];
}
-(void)shoot{
    if(dragginPoint.x != 0 && dragginPoint.y != 0){
        ProjectileStone *projectile = [[ProjectileStone alloc]initWithPosition:self.position];
        [self.parent addChild:projectile];
        [projectile fireInDirection:dragginPoint power:101];
    }
    
}
@end
