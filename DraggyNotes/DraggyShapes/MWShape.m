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


#import "MWShape.h"
#import "MWShapeWithImage.h"
#import "UILabel+DraggyControl.h"
@interface MWShape ()

@property (nonatomic,readwrite ,unsafe_unretained) ShapeType type;

// getTitle
@property (nonatomic,readwrite,copy) NSString* title;

// get Background Color
@property (nonatomic,readwrite,strong) UIColor* backgroundColor;

// setter Color
@property (nonatomic,weak) UIColor* currentColor;

// set/get shape identfier
@property (nonatomic,readwrite, strong) NSNumber* identifier ;


@end

@implementation MWShape

/// Attributes used to draw a shape will be

CGFloat netRotation;
/// initilaizer

+(MWShape*)shapeWithImage:(UIImage*)backgroundImage andText:(NSString*)titleText frame:(CGRect)frame
{
    return [[MWShapeWithImage alloc]initWithTitle:titleText andBackgrundImage:backgroundImage andFrame:frame];
}


+(MWShape*)shapeWithColor:(UIColor*)backgroundColor andText:(NSString*)titleText frame:(CGRect)frame
{
    return [[MWShape alloc]initWithTitle:titleText andBackgroundColor:backgroundColor andFrame:frame];
    
}

#pragma mark - Initiliazers -

// designated
- (instancetype)initWithTitle:(NSString *)titleText andBackgroundColor:(UIColor*)backgroundColor andFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
        
        self.title=titleText;
        self.backgroundColor=backgroundColor;
        self.currentColor=self.backgroundColor;
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
        tapGesture.numberOfTapsRequired=1;
        [self addGestureRecognizer:tapGesture];
        tapGesture.delegate=self;
        
        
        UIRotationGestureRecognizer *rotateGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotateGesture:)];
        rotateGesture.delegate=self;
        [self addGestureRecognizer:rotateGesture];
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
        panGesture.delegate=self;
                [self addGestureRecognizer:panGesture];
        
        UILabel *titleLabel=[[UILabel alloc]init];
        [self addSubview:titleLabel];
      
        [titleLabel adjustItToControlStandards];
        titleLabel.text=titleText;
      

	}
  
	return self;
}


// The simlpest plain shape here
-(void) drawRect: (CGRect) rect
{
    
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, self.currentColor.CGColor);
    CGContextFillRect(context, self.bounds);



}


#pragma mark- Debugging Purposes -

- (NSString *)description {
	return [NSString stringWithFormat:@"<%@: %p, \" %li\">",
	        [self class], self.title, (long)self.identifier];
}

// For object identfier uniqeniess
- (NSUInteger)hash {
	NSString *stringToHash =
    [NSString stringWithFormat:@"%@:%li",
     self.title, (long)self.identifier];
	return [stringToHash hash];
}

- (BOOL)isEqual:(id)object {
	if ([object isKindOfClass:[MWShape class]]) {
		if ([(MWShape *)object hash] == [self hash]) {
			return true;
		}
		else
			return false;
	}
	else
		return false;
}


#pragma mark - Attributes Setters -

- (void) changeTitleTextTo:(NSString*)newTitle
{
    self.title=newTitle;
}

- (void) changeBackgroundColorTo:(UIColor*)newColor
{
    self.currentColor=newColor;
    [self setNeedsDisplay];
}

#pragma mark - Gesture Recgonizers -

-(void)handleTapGesture:(UIGestureRecognizer *) sender{
    NSLog(@"Tap gesture Called Here");
    [self.delegate didTap:self];
    
}

-(void) handleRotateGesture:(UIGestureRecognizer *) sender{
    [[self superview] bringSubviewToFront:self];
 	if([(UIRotationGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
        
		netRotation = 0.0;
		return;
	}
    // calculating amount of rotation needed
	CGFloat rotation = 0.0 - (netRotation - [(UIRotationGestureRecognizer*)sender rotation]);
    // calculating current transformation as rotating might not be on the image exactly
	CGAffineTransform currentTransform = [(UIPinchGestureRecognizer*)sender view].transform;
    //calculating transformaton needed from the current state
	CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform,rotation);
    NSLog(@"The current transform is %f  %f %f %f %f %f  while the current rotation is %f",currentTransform.a,currentTransform.b,currentTransform.c,currentTransform.d,currentTransform.tx,currentTransform.ty,rotation);
    // rotating takes place now
	[self setTransform:newTransform];
    
	netRotation = [(UIRotationGestureRecognizer*)sender rotation];
    [self.delegate didRotate:self];
    
}
- (void)handlePanGesture:(UIPanGestureRecognizer *)gestureRecognizer {
  
    /// Bring it to the front view and highlight it
    [[self superview] bringSubviewToFront:self];
    
    CGPoint translation = [gestureRecognizer translationInView:[self superview]];
    [self setCenter:CGPointMake([self center].x + translation.x, [self center].y + translation.y)];
    
    [gestureRecognizer setTranslation:CGPointZero inView:[self superview]];
    [self.delegate didMove:self];
    
    if(gestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        if ([self.delegate respondsToSelector:@selector(didEndMove:)]) {
    [self.delegate didEndMove:self];
        }
    }
    
}


-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
    
}

@end
