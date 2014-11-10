//
//  WaveHandler.h
//  Slingshot
//
//  Created by Olle Lind on 10/11/14.
//  Copyright (c) 2014 Olle Lind. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface WaveHandler : NSObject

+(WaveHandler *)handler;

@property (nonatomic, weak) SKScene *gameScene;

-(void)startWave;
-(void)update:(CFTimeInterval)time;

@end
