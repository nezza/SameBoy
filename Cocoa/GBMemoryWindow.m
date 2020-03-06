//
//  GBMemoryWindow.m
//  testxib
//
//  Created by Thomas Roth on 22.01.20.
//  Copyright © 2020 Thomas Roth. All rights reserved.
//

#import "GBMemoryWindow.h"
#include <Core/gb.h>

@interface GBMemoryWindow ()

@end


@implementation GBMemoryWindow
{
    GB_gameboy_t *gb;
    uint16_t addr;
    int length;
}
@synthesize memoryLabel;

- (void)setGameBoy:(GB_gameboy_t*)gb_ {
    gb = gb_;
}


-(void)onTick:(NSTimer *)timer {
    NSString *s = @"";
    for(int i=0; i < length; i++) {
        uint8_t memory = GB_read_memory(gb, addr+i);
        if(s.length > 0) {
            s = [NSString stringWithFormat:@"%@ %02X", s, (int)memory];
        } else {
            s = [NSString stringWithFormat:@"%02X", (int)memory];
        }
    }
    [self.memoryLabel setStringValue:s];
}

- (void)startWatching:(uint16_t)addr_ length:(int)length_ {
    addr = addr_;
    length = length_;
    

    NSTimer *t = [NSTimer scheduledTimerWithTimeInterval:0.1
    target:self
    selector:@selector(onTick:)
    userInfo:nil
    repeats:YES];
    [self onTick:t];
}

@end
