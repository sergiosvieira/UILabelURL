//
//  ViewController.m
//  Link
//
//  Created by Paulo Pinheiro on 2/13/14.
//  Copyright (c) 2014 Bravo Inovação. All rights reserved.
//

#import "ViewController.h"

#import "UILabel+Boldify.h"

@interface ViewController ()

@property (strong, nonatomic) UILabel * label;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 320, 21)];
    UIFont * font = [UIFont fontWithName:@"GillSans-Light" size:10.f];

    self.label.attributedText = nil;
    self.label.tag = 1978;
    self.label.numberOfLines = 1;
    [self.label setFont:font];
    [self.label setTextAlignment:NSTextAlignmentCenter];
    self.label.text = @"clique aqui http://www.google.com e depois http://www.uol.com.br";
    [self createLink:self.label];
    [self.view addSubview:self.label];
}

- (void)createLink:(UILabel *)label
{
    NSError * error = nil;
    NSString * regexStr = [NSString stringWithFormat:@"http?://([-\\w\\.]+)+(:\\d+)?(/([\\w/_\\.]*(\\?\\S+)?)?)?"];
    
    NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:regexStr options:0 error:&error];

    if (!error)
    {
        NSString * str = label.text;
        NSArray * results = [regex matchesInString:str options:kNilOptions range:NSMakeRange(0, str.length)];
        
        for(NSTextCheckingResult * result in [results reverseObjectEnumerator])
        {
            NSString * subStr = [str substringWithRange:[result rangeAtIndex:0]];
            [self.label hyperlinkSubstring:subStr];

            NSLog(@"%@", subStr);
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];


    if (CGRectContainsPoint([self.label frame], [touch locationInView:self.view]))
    {
        NSLog(@"%@", touch);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
