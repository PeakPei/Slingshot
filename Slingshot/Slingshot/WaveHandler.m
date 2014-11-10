//
//  WaveHandler.m
//  Slingshot
//
//  Created by Olle Lind on 10/11/14.
//  Copyright (c) 2014 Olle Lind. All rights reserved.
//

#import "WaveHandler.h"
#import "Wave.h"
#import "WaveOne.h"
#import "Spawn.h"

@implementation WaveHandler{
    Wave *currentWave;
    CFTimeInterval waveStart;
    CFTimeInterval waveDuration;
}

static WaveHandler *_handler = nil;

-(id)init{
    self = [super init];
    
    return self;
}

+(WaveHandler *)handler{
    static dispatch_once_t onceToken;
    //thread-safe way to create a singleton
    dispatch_once(&onceToken, ^{
        _handler = [[WaveHandler allocWithZone:nil] init];
    });
    return _handler;
}

-(void)startWave{
    if(!currentWave){
        currentWave = [WaveOne buildWave];
        waveDuration = 0;
        waveStart = 0;
    }
}

-(void)update:(CFTimeInterval)time{
    if(!currentWave)
        return;
    if(waveStart == 0)
        waveStart = time;
    waveDuration = time-waveStart;
    [self spawn:waveDuration];
}

-(void)spawn:(CFTimeInterval)duration{
    Spawn *eligibleSpawn = nil;
    for(Spawn *spawn in currentWave.spawns){
        if(spawn.spawntime <= duration){
            eligibleSpawn = spawn;
            break;
        }
    }
    if(eligibleSpawn){
        [self.gameScene addChild:eligibleSpawn.badguy];
        [currentWave unleach:eligibleSpawn];
    }
}

@end

