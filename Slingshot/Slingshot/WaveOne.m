//
//  WaveOne.m
//  Slingshot
//
//  Created by Olle Lind on 10/11/14.
//  Copyright (c) 2014 Olle Lind. All rights reserved.
//

#import "WaveOne.h"
#import "Wave.h"
#import "BadGuyZombie.h"
#import "Spawn.h"

@implementation WaveOne

+(Wave *)buildWave{
    WaveOne *wave = (WaveOne *)[Wave buildWave];
    for(int i=0; i<30; i++){
        Spawn *spawn = [[Spawn alloc]init];
        spawn.spawntime = i*2;
        spawn.xPosition = arc4random()%(int)screenSize.width;
        
        BadGuyZombie *zombie = [[BadGuyZombie alloc]initWithPosition:CGPointMake(spawn.xPosition, screenSize.height)];
        spawn.badguy = zombie;
        
        [wave.spawns addObject:spawn];
    }
    return wave;
}

@end
