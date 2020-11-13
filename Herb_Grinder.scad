translate([60,0,0])
    difference(){
        union(){
            cylinder (h = 10, r=55, center = false, $fn=100);
            cylinder (h = 30, r=50, center = false, $fn=100);
        }
        translate([0,0,5])
            cylinder (h = 30, r=45, center = false, $fn=100);
    }

translate([-60,0,0])
    difference(){
        
        cylinder (h = 30, r=55, center = false, $fn=100); 
        translate([0,0,5])
            cylinder (h = 30, r=50, center = false, $fn=100); 
    }

translate([60,0,0])
    sideTeeth(5);
translate([-60,0,0])
    sideTeeth(0);

module spine(x,y,z,d) {
    translate([x,y,z])
        rotate([0,0,d])
        intersection(){    
            translate([29,0,0])
                cylinder (h = 30, r=30, center = false, $fn=100); 
            translate([-29,0,0])
                cylinder (h = 30, r=30, center = false, $fn=100); 
        }
}

module ridge(dia, stepSize){
    //stepSize =  log(dia) * 10 * (dia * .1);
    for(spot=[0:stepSize:359]){
        translate([sin(spot)*dia,cos(spot)*dia,0])  // position control with radius multiplier
        //spine(0,0,2.5,spot - 45);
        cylinder (h = 25, r=2.5, center = false, $fn=100); 

    }
    
}

module sideTeeth(offset){
        
    union(){
     ridge(40 + offset, 20);
     ridge(30 + offset, 30);
     ridge(20 + offset, 40); 
     ridge(10 + offset, 50);  
    }
 
}