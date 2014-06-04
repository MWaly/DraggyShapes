//
//  MWViewController.m
//  DraggyShapes
//
//  Created by Mohamed Mokhles Waly on 5/19/14.
//  Copyright (c) 2014 Mokhles. All rights reserved.
//

#import "MWViewController.h"
#import "MWShape.h"
#import "MWShapeWithImage.h"
@interface MWViewController ()

@end

@implementation MWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    
    MWShape* shape1=[MWShape shapeWithColor:[UIColor greenColor] andText:@"Object 1" frame:CGRectMake(0, 90, 70, 50)];
   
    shape1.delegate=self;
    [shape1 setHighlightingColor:[UIColor redColor]];
    [self.view addSubview:shape1];
    
    
    MWShape* shape2=[MWShapeWithImage shapeWithImage:[UIImage imageNamed:@"Genie_cool.png"] andText:@"Test Image 1" frame:CGRectMake(65, 150, 130, 88)];
    shape2.delegate=self;
    [self.view addSubview:shape2];
    
    
    MWShape* shape3=[MWShapeWithImage shapeWithImage:[UIImage imageNamed:@"aladin_lamp.png"] andText:@"Test Image 2" frame:CGRectMake(115, 250, 130, 88)];
    shape3.delegate=self;
    [self.view addSubview:shape3];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Delegate Calls
-(void)didTap:(MWShape*)tappedShape
{
    NSLog(@"The tapped shape is %@",tappedShape.title);
    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"Draggy Shapes" message:@"Did press here" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alertView show];
};

// Highlighting The move
-(void)didMove:(MWShape*)movedShape
{
 NSLog(@"The moved shape is %@",movedShape.title);
    if ([movedShape respondsToSelector:@selector(changeBackgroundColorTo:)] && [movedShape respondsToSelector:@selector(highlightingColor)]) {
        [movedShape changeBackgroundColorTo:movedShape.highlightingColor];
    }

}

// UnHighlighting The move
-(void)didEndMove:(MWShape*)movedShape
{
    if ([movedShape respondsToSelector:@selector(changeBackgroundColorTo:)] && [movedShape respondsToSelector:@selector(highlightingColor)]) {
        [movedShape changeBackgroundColorTo:movedShape.backgroundColor];
    }
}

-(void)didRotate:(MWShape*)rotatedShape
{
 NSLog(@"The rotated shape is %@",rotatedShape.title);
}
@end
