translate([60,0,0])
    difference(){
        union(){
            cylinder (h = 10, r=55, center = false, $fn=100);
            cylinder (h = 30, r=50, center = false, $fn=100);
        }
        translate([0,0,5])
            cylinder (h = 30, r=45, center = false, $fn=100);
    }
    
translate([60,0,0])
    sideTeeth(5);

translate([60,0,0])
    grips();

translate([-60,0,0])
    difference(){
        
        cylinder (h = 30, r=55, center = false, $fn=100); 
        translate([0,0,5])
            cylinder (h = 30, r=50, center = false, $fn=100); 
    }

translate([-60,0,0])
    sideTeeth(0);
translate([-60,0,0])
    grips();



//grips?
module grips (){
    
    difference(){ 
        ridge(55, 10); 
        translate([0,0,10])
        cylinder (h = 20, r=60, center = false, $fn=100); 
    }   
}

module ridge(dia, stepSize){
    for(spot=[0:stepSize:359]){
        translate([sin(spot)*dia,cos(spot)*dia,0])  // position control with radius multiplier
        cylinder (h = 25, r=2.5, center = false, $fn=100); 

    }
    
}

module sideTeeth(offset){
        
    union(){
     ridge(40 + offset, 20);
     ridge(30 + offset, 30);
     ridge(20 + offset, 40); 
     ridge(10 + offset, 52);  
    }
 
}