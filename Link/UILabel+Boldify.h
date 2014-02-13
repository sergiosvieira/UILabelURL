//
//  UILabel+Boldify.h
//  Link
//
//  Created by Paulo Pinheiro on 2/13/14.
//  Copyright (c) 2014 Bravo Inovação. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Boldify)
- (void) boldSubstring: (NSString*) substring;
- (void)hyperlinkSubstring:(NSString*)substring;
- (void) boldRange: (NSRange) range;

@end