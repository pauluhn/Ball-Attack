//
//  BAMyScene.m
//  Ball Attack
//
//  Created by Paul Uhn on 6/29/14.
//  Copyright (c) 2014 Paul. All rights reserved.
//

#import "BAMyScene.h"

@implementation BAMyScene
{
    CGPoint _startPoint;
    SKSpriteNode *_sprite;
}

#pragma mark - Lifecycle

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKNode *edges = [SKNode node];
        edges.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        [self addChild:edges];
        
        _sprite = [SKSpriteNode spriteNodeWithImageNamed:@"SoccerBall"];
        _sprite.position = CGPointMake(size.width * 0.5, size.height * 0.5);
        _sprite.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:_sprite.size.width * 0.5];
        _sprite.physicsBody.affectedByGravity = NO;
        [self addChild:_sprite];
    }
    return self;
}

#pragma mark - Touches

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        _startPoint = [touch locationInNode:self];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        CGPoint endPoint = [touch locationInNode:self];
        CGVector vector = CGVectorMake(endPoint.x - _startPoint.x,
                                       endPoint.y - _startPoint.y);        
        _sprite.physicsBody.velocity = vector;
    }
}

#pragma mark - Game loop

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
