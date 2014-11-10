//
//  Wave.m
//  Slingshot
//
//  Created by Olle Lind on 10/11/14.
//  Copyright (c) 2014 Olle Lind. All rights reserved.
//

#import "Wave.h"

@implementation Wave

+(Wave *)buildWave{
    Wave *wave = [[Wave alloc]init];
    wave.spawns = [NSMutableArray array];
    return wave;
}

-(void)unleach:(Spawn *)spawn{
    [self.spawns removeObject:spawn];
    [spawn.badguy attack];
}

@end
