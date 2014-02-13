//
//  UILabel+Boldify.m
//  Link
//
//  Created by Paulo Pinheiro on 2/13/14.
//  Copyright (c) 2014 Bravo Inovação. All rights reserved.
//

#import "UILabel+Boldify.h"

@implementation UILabel (Boldify)
- (void)boldRange:(NSRange)range {
    if (![self respondsToSelector:@selector(setAttributedText:)]) {
        return;
    }
    NSMutableAttributedString *attributedText;
    if (!self.attributedText) {
        attributedText = [[NSMutableAttributedString alloc] initWithString:self.text];
    } else {
        attributedText = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];
    }
    [attributedText setAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:self.font.pointSize]} range:range];
    self.attributedText = attributedText;
}

- (void)hyperlinkRange:(NSRange)range withURLString:(NSString *)urlString
{
    if (![self respondsToSelector:@selector(setAttributedText:)]) {
        return;
    }
    NSMutableAttributedString * attributedText;
    if (!self.attributedText) {
        attributedText = [[NSMutableAttributedString alloc] initWithString:self.text];
    } else {
        attributedText = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];
    }

    [attributedText beginEditing];
    [attributedText addAttribute:NSLinkAttributeName value:urlString range:range];
    
    // make the text appear in blue
    [attributedText addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:range];
    
    // next make the text appear with an underline
    [attributedText addAttribute:
     NSUnderlineStyleAttributeName value:@(1) range:range];
    
    [attributedText endEditing];
    
    self.attributedText = attributedText;
}


- (void)boldSubstring:(NSString*)substring {
    NSRange range = [self.text rangeOfString:substring];
    [self boldRange:range];
}

- (void)hyperlinkSubstring:(NSString*)substring
{
    NSRange range = [self.text rangeOfString:substring];
    [self hyperlinkRange:range withURLString:self.text];
}



@end