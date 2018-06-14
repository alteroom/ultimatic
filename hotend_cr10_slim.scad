// hotend CR10
$fn = 40;
SLEEVE_L = 20;
SLEEVE_D0 = 6;
SLEEVE_D1 = 8;
SLEEVE_WALL = 2;

module UMSleeveHolder(){
    difference(){
       cylinder(h = SLEEVE_L, d = SLEEVE_D1 + 2*SLEEVE_WALL, center=true);
       scale([1,1,1.01])cylinder(h = SLEEVE_L, d = SLEEVE_D1, center=true);
       
    }
    % difference(){
       cylinder(h = SLEEVE_L, d = SLEEVE_D1, center=true);
       scale([1,1,1.01])cylinder(h = SLEEVE_L, d = SLEEVE_D0, center=true);
    }
    % cylinder(h = SLEEVE_L*15, d = SLEEVE_D0, center=true);
}

module UMSleeveHull(){
    scale([1,1,1.01]) cylinder(h = SLEEVE_L, d = SLEEVE_D1 + 2*SLEEVE_WALL, center=true);
}

module UMHotend(){
    union(){
        translate([0,7,26]) rotate ([0,90,0]) scale([1,1,1]) UMSleeveHolder();
        translate([10,3,6]) rotate ([90,0,0]) UMSleeveHolder();
        
        translate([-10,9,-17]) cube([2,4,10]);
        translate([8,9,-17])  cube([2,4,10]);
        
        translate([-16,9,-11]) rotate ([0, 90, 0]) cube([8,4,32]);
        
        difference(){
            translate([-18,13,-11]) rotate ([90, 90, 0]) cube([8,4,26]);
            translate([-16, 6,-15]) rotate ([0, 90, 0]) scale([1,1,1.01]) cylinder(h = 4, d = 3, center=true);
            translate([-16, -6,-15]) rotate ([0, 90, 0]) scale([1,1,1.01]) cylinder(h = 4, d = 3, center=true);
        }
        difference(){
            translate([14,13,-11]) rotate ([90, 90, 0]) cube([8,4,26]);
            translate([16, 6,-15]) rotate ([0, 90, 0]) scale([1,1,1.01]) cylinder(h = 4, d = 3, center=true);
            translate([16, -6,-15]) rotate ([0, 90, 0]) scale([1,1,1.01]) cylinder(h = 4, d = 3, center=true);
        }
        difference(){
            translate([-10,1,-8]) cube([20,12,30]);
            translate([-6,0,0]) cube([12,14,16]);
            translate([-7, 7, -4]) rotate([90,0,0]) scale([1,1,1.01]) cylinder(h = 12, d = 3, center=true);
            translate([7, 7, -4]) rotate([90,0,0]) scale([1,1,1.01]) cylinder(h = 12, d = 3, center=true);
            translate([0,7,26]) rotate ([0,90,0]) scale([1,1,1]) UMSleeveHull();
            translate([10,3,6]) rotate ([90,0,0]) UMSleeveHull(); 
        }
    }
}

module UMCR10(){
    union(){
        difference(){
            cube([20,12,27], center = false);
            translate([3, 6, 23]) rotate([90,0,0]) scale([1,1,1.01]) cylinder(h = 12, d = 2.9, center=true);
            translate([17, 6, 23]) rotate([90,0,0]) scale([1,1,1.01]) cylinder(h = 12, d = 2.9, center=true);
        }
        translate([0, -10, 1]) cube([20,10,20], center = false);

        translate([0, -8, -16]) cube([20,20,12], center = false);
        translate([10, 6, -11]) cylinder(h = 22, d = 8, center=true);
       
        translate([10, 6, 33]) cylinder(h = 12, d = 12, center=true);
        translate([10, 6, 45]) cylinder(h = 12, d = 6, center=true);
    }
}


module UMDrawHotend(){
    translate([0, 0, -6]){
        % translate([-10,-6,-27]) UMCR10();
        difference(){
            UMHotend();
            translate([-10,-6.01,-27]) UMCR10();
        }    
    }
    
}

module UME3DFan(){
    #import("e3d fan.stl");        
}

UMDrawHotend();

module UMCoolingPart(){
    difference (){
        union(){
            translate ([0, 0, 0.5]) cube([80, 30, 1], center = true);
            translate ([-19, -15, 0.5]) cube([1, 30, 20], center = false);    
        }    
        translate ([0, 0, 0.5]) cylinder(h = 2, d=20, center = true);
    }
    
}


