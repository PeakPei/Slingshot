//
//  Wave.h
//  Slingshot
//
//  Created by Olle Lind on 10/11/14.
//  Copyright (c) 2014 Olle Lind. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Spawn.h"


@interface Wave : NSObject

@property (nonatomic, strong) NSMutableArray *spawns;

+(Wave *)buildWave;
-(void)unleach:(Spawn *)spawn;

@end
