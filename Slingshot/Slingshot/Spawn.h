//
//  Spawn.h
//  Slingshot
//
//  Created by Olle Lind on 10/11/14.
//  Copyright (c) 2014 Olle Lind. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BadGuy.h"

@interface Spawn : NSObject

@property (nonatomic, strong) BadGuy *badguy;
@property (nonatomic) NSTimeInterval spawntime;
@property (nonatomic) double xPosition;

@end
