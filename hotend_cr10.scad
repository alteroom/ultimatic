// hotend CR10
$fn = 40;
SLEEVE_L = 30;
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
    % cylinder(h = SLEEVE_L*10, d = SLEEVE_D0, center=true);
}

module UMSleeveHull(){
    scale([1,1,1.01]) cylinder(h = SLEEVE_L, d = SLEEVE_D1 + 2*SLEEVE_WALL, center=true);
}

module UMHotend(){
    union(){
        translate([0,11,21]) rotate ([0,90,0]) scale([1,1,1]) UMSleeveHolder();
        translate([11,0,6]) rotate ([90,0,0]) scale([1,1,1]) UMSleeveHolder();
        
        
        
       
    }
}

module UMCR10(){
    union(){
        difference(){
            cube([20,12,27], center = false);
            translate([3, 6, 23]) rotate([90,0,0]) scale([1,1,1.01]) cylinder(h = 12, d = 2.9, center=true);
            translate([17, 6, 23]) rotate([90,0,0]) scale([1,1,1.01]) cylinder(h = 12, d = 2.9, center=true);
        }
        difference(){
            translate([0, -10, 0]) cube([20,10,20], center = false);
            //translate([3, -5, 23]) rotate([90,0,0])scale([1,1,1.01]) cylinder(h = 10, d = 2.9, center=true);
            //translate([17, -5, 23]) rotate([90,0,0])scale([1,1,1.01]) cylinder(h = 10, d = 2.9, center=true);
        }
        translate([0, -8, -16]) cube([20,20,12], center = false);
        translate([10, 6, -11]) cylinder(h = 22, d = 8, center=true);
       
        translate([10, 6, 34]) cylinder(h = 14, d = 12, center=true);
        translate([10, 6, 48]) cylinder(h = 14, d = 6, center=true);
    }
}

module UMDrawHotend(){
    % translate([-6, 10, 22]) rotate([0,0,-90]) UMCR10();
    difference(){
        translate([0, 0, 34]) UMHotend();
        translate([-6, 10, 22]) rotate([0,0,-90]) UMCR10();
    }
}

module UME3DFan(){
    #import("e3d fan.stl");        
}

UMDrawHotend();

