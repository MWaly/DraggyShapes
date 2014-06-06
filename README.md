 
 
 A simple light weight UIView Objects Combined with options to tap , drag and rotate 
 
 This is the first release  , more to come soon  (Maybe in Swift) 
 
> Installation
 -------------
 
 
  Dragging the 'DraggyShapes' from the demo project 
 
 
> Usage
 -----
 
 Add an MWShape to your View controller as in example :
   
 Add a Basic shape:
   
     MWShape* shape1=[MWShape shapeWithColor:[UIColor greenColor] andText:@"Object 1" frame:CGRectMake(0, 90, 70, 50)];
     
 Add a shape based on background images
  
    MWShape* shape1=[MWShapeWithImage shapeWithImage:[UIImage imageNamed:@"Genie_cool.png"] andText:@"Test Image 1" frame:CGRectMake(65, 150, 130, 88)];
  
 Set the Delegate  

 <code>  shape1.delegate=self; </code>
    
 Set the color of it when having being dragged

 <code> [shape1 setHighlightingColor:[UIColor redColor]]; </code> 
  
 Add it 

 <code> [self.view addSubview:shape1]; </code>
    
    
    
>  Delegate Methods  
   ---- 
   
 <code> -(void)didTap:(MWShape*)tappedShape; </code>


 <code> -(void)didMove:(MWShape*)movedShape; </code>


 <code> -(void)didEndMove:(MWShape*)movedShape; </code>


 <code> -(void)didRotate:(MWShape*)rotatedShape; </code>


Feel free to contact me for suggestions or any feedback
    
    
    
    
    
    
    
