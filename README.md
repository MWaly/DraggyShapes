 
 
 A simple light weight UIView Objects Combined with options to tap , drag and rotate 
 
 This is the first release  , more to come soon  (Maybe in Swift) 
 
 Installation
 -------------
 

  Dragging the 'DraggyShapes' from the demo project 
 
 
 Usage
 -----
 
 Add an MWShape to your View controller as in example :
   
   For Basic shape:
     MWShape* shape1=[MWShape shapeWithColor:[UIColor greenColor] andText:@"Object 1" frame:CGRectMake(0, 90, 70, 50)];
     
  For Shapes based on background images
  
    MWShape* shape1=[MWShapeWithImage shapeWithImage:[UIImage imageNamed:@"Genie_cool.png"] andText:@"Test Image 1" frame:CGRectMake(65, 150, 130, 88)];
  
 Set the delegate   
    shape1.delegate=self;
    
Set the color of it when having being dragged

  [shape1 setHighlightingColor:[UIColor redColor]];
  
Add it 
  [self.view addSubview:shape1];
    
    Delegate Methods 
    
-(void)didTap:(MWShape*)tappedShape;
// Check if overlapping or not and take an action then
-(void)didMove:(MWShape*)movedShape;
// Check if overlapping or not and take an action then
-(void)didEndMove:(MWShape*)movedShape;
// Check if overlapping or not and take an action then
-(void)didRotate:(MWShape*)rotatedShape;

Feel free to contact me for suggestions or any feedback
    
    
    
    
    
    
    
