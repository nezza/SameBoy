//
//  GBMemoryWindow.h
//  testxib
//
//  Created by Thomas Roth on 22.01.20.
//  Copyright © 2020 Thomas Roth. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include <Core/gb.h>
NS_ASSUME_NONNULL_BEGIN

@interface GBMemoryWindow : NSWindow
@property (strong) IBOutlet NSTextField *memoryLabel;
- (void)setGameBoy:(GB_gameboy_t*)gb_;
- (void)startWatching:(uint16_t)addr_ length:(int)length_;
@end


NS_ASSUME_NONNULL_END
