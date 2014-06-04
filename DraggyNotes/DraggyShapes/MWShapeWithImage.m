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
@import QuartzCore;


#import "MWShapeWithImage.h"
#import "UILabel+DraggyControl.h"
@interface MWShapeWithImage ()
@property (nonatomic,readwrite ,unsafe_unretained) ShapeType type;

// getTitle
@property (nonatomic,readwrite,copy) NSString* title;
// set/get shape identfier
@property (nonatomic,readwrite, strong) NSNumber* identifier ;

@property (nonatomic,readwrite, strong) UIImage* backgroundImage;
@property (nonatomic,readwrite, strong) UIImageView* backgroundImageView;
@end



@implementation MWShapeWithImage

@synthesize type=_type;
@synthesize identifier=_identifier;
@synthesize title=_title;



#pragma mark - Initliazer -
// designated
- (instancetype)initWithTitle:(NSString *)titleText andBackgrundImage:(UIImage*)backgroundImage andFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
    
        self.backgroundImage=backgroundImage;
        self.title=titleText;
        
        /// Selectors  Written like this to suppress the compiler warnings from not finding the method in this class
        
        // Tap Gesture Handling
        SEL tapGestureSelector=NSSelectorFromString(@"handleTapGesture:");
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:tapGestureSelector];
        tapGesture.numberOfTapsRequired=1;
        [self addGestureRecognizer:tapGesture];
        tapGesture.delegate=self;
       
        // Rotation Gesture Handling
        SEL rotationGestureSelector=NSSelectorFromString(@"handleRotateGesture:");

        UIRotationGestureRecognizer *rotateGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:rotationGestureSelector];
        rotateGesture.delegate=self;;
        [self addGestureRecognizer:rotateGesture];
        
        
        
        // Pan Gesture Handling
        SEL panGestureSelector=NSSelectorFromString(@"handlePanGesture:");
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:panGestureSelector];
        panGesture.delegate=self;
        [self addGestureRecognizer:panGesture];
        
        
        // Setting colors
        self.backgroundColor=[UIColor clearColor];
        self.highlightingColor=[UIColor clearColor];
        
        /// Adding the image and customizing the opacity
        self.backgroundImageView=[[UIImageView alloc]initWithImage:self.backgroundImage];
        self.backgroundImageView.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        self.backgroundImageView.bounds=self.bounds;
        self.backgroundImageView.backgroundColor=[UIColor clearColor];
        [self changeBackgroundColorTo:self.backgroundColor];
        
        [self setOpaque:NO];
        [[self layer] setOpaque:NO];
        [self addSubview:self.backgroundImageView];
        
        
        
      
    
        
        // Adding Label
        UILabel *titleLabel=[[UILabel alloc]init];
        [self addSubview:titleLabel];
        
        [titleLabel adjustItToControlStandards];
        titleLabel.text=titleText;

	}
    
	return self;
}


#pragma mark - Changing Attributes

- (void) changeBackgroundImageTo:(UIImage*)newImage
{
    self.backgroundImageView.image=newImage;
}


@end
