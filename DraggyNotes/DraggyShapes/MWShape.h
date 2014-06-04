// The MIT License
//
// Copyright (c) 2014 Mohamed Waly
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#import <Foundation/Foundation.h>
#import "MWSpaceProtocol.h"

@interface MWShape : UIView <UIGestureRecognizerDelegate>


+(MWShape*)shapeWithImage:(UIImage*)backgroundImage andText:(NSString*)titleText frame:(CGRect)frame;
+(MWShape*)shapeWithColor:(UIColor*)backgroundColor andText:(NSString*)titleText frame:(CGRect)frame;



// Determine the type of the shape
@property (nonatomic,readonly ,unsafe_unretained) ShapeType type;

// getTitle
@property (nonatomic,readonly ,copy) NSString* title;

// get Background Color
@property (nonatomic,readonly , strong) UIColor* backgroundColor;
// set Highlighting Color
@property (nonatomic,strong) UIColor* highlightingColor;

// set/get shape identfier
@property (nonatomic,readonly , strong) NSNumber* identifier ;
@property (nonatomic,weak)id <MWSpaceProtocol>delegate;
// Setters
- (void) changeTitleTextTo:(NSString*)newTitle;
- (void) changeBackgroundImageTo:(UIImage*)newImage;
- (void) changeBackgroundColorTo:(UIColor*)newColor;

@end
