//
//  UILabel+DraggyControl.m
//  DraggyShapes
//
//  Created by Mohamed Mokhles Waly on 5/21/14.
//  Copyright (c) 2014 Mokhles. All rights reserved.
//

#import "UILabel+DraggyControl.h"
#define WidthOffset  0.05    // set to 5%
#define HeightOffset  0.05   // set to 5%

#define Font  @"Marker Felt"    
#define FontSize 12
#define NumberOfLines 1

@implementation UILabel (DraggyControl)

// Cusotmizing the label here
- (void) adjustItToControlStandards
{
    self.frame=CGRectMake(self.superview.frame.size.width*WidthOffset, self.superview.frame.size.height*HeightOffset, self.superview.frame.size.width-(self.superview.frame.size.width*WidthOffset*2),self.superview.frame.size.height-(self.superview.frame.size.height*HeightOffset*2));
    [self.superview clipsToBounds];
    self.font=[UIFont fontWithName:Font size:FontSize];
    self.numberOfLines=NumberOfLines;
    [self setAdjustsFontSizeToFitWidth:YES];
    
    
}
@end
