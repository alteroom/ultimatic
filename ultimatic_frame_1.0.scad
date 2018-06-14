// ultimatic by Aleksandr Petrov
// hotend
use <hotend_cr10_slim.scad>; 
$fn = 40;
// size of frame
// print area
UM_PRINT_AREA = [150, 150, 150];
// non print area
UM_NON_PRINT_AREA = [110, 130, 180];

UM_SIZE = UM_PRINT_AREA + UM_NON_PRINT_AREA;
UM_X = UM_SIZE[0];
UM_Y = UM_SIZE[1];
UM_Z = UM_SIZE[2];
echo(UM_SIZE);

// 4 mm plywood frame walls width
UM_WALL = 4;
// Frame IDs
UM_FRAME_FRONT = 0;
UM_FRAME_BACK = 1;
UM_FRAME_LEFT = 2;
UM_FRAME_RIGHT = 3;
UM_FRAME_TOP = 4;
UM_FRAME_BOTTOM = 5;
UM_FRAMES_COUNT = 6;
// Frame sizes
UM_FRAME_SIZES = [
    [UM_X, UM_Z, UM_WALL],
    [UM_X, UM_Z, UM_WALL],
    [UM_Y, UM_Z, UM_WALL],
    [UM_Y, UM_Z, UM_WALL], 
    [UM_X, UM_Y, UM_WALL],
    [UM_X, UM_Y, UM_WALL]
];
UM_COLORS = [
    "",
    "Green",
    "",
    "",
    "",
    "Green"
];
// Frame offsets
UM_FRAME_OFFSETS = [
    [0,-UM_Y+UM_WALL,0],
    [0,0,0],
    [UM_WALL,0,0],
    [UM_X,0,0], 
    [0,0,UM_Z],
    [0,0,60+UM_WALL]
];
// Frame rotations
UM_FRAME_ROTATIONS = [
    [90,0,0],
    [90,0,0],
    [90,0,-90],
    [90,0,-90], 
    [180,0,0],
    [180,0,0]
];
// Frame modifiers
UM_ROD_GAP = 16;
UM_ROD_MAX = 20;

// 24 + 18 + 14 = 24 + 32 = 56 + 32 = 88 + 150 = 238 + 22

UM_LEFT_ROD_OFFSET = [UM_WALL+18, UM_Z - UM_WALL - UM_ROD_MAX*1.5, 0];
UM_RIGHT_ROD_OFFSET = [UM_X - 12-UM_WALL, UM_Z - UM_WALL - UM_ROD_MAX*1.5, 0];
UM_BACK_ROD_OFFSET = [UM_WALL+34, UM_Z - UM_WALL - UM_ROD_MAX*0.5, 0];
UM_FRONT_ROD_OFFSET = [UM_Y - UM_WALL - UM_ROD_MAX*0.5, UM_Z - UM_WALL - UM_ROD_MAX*0.5, 0];
// screw
UM_SREW_GAP = 3;
// motors
UM_MOTOR_GAP = 22;
UM_MOTOR_SIZE = 40;
UM_MOTOR_SCREW_OFFSET = 4;
UM_Z_ROD_GAP = 12;
UM_Z_ROD_GAP2 = 21;
UM_Z_ROD_OFFSET = 18;
UM_X_MOTOR_OFFSET = round(sqrt(6400-pow(UM_LEFT_ROD_OFFSET[0]-UM_WALL-UM_MOTOR_SIZE*0.2, 2)));
UM_Y_MOTOR_OFFSET = round(sqrt(6400-pow(UM_BACK_ROD_OFFSET[0]-UM_WALL-UM_MOTOR_SIZE*0.2, 2)));
// modifiers
UM_RECT_MODIFIER = "rect";
UM_RECT_CORNERS_MODIFIER = "rect_corners";
UM_CIRCLE_MODIFIER = "circle";
UM_MOTOR_MODIFIER = "motor";

// [name, type, frame_id, offset, size, size2]
UM_MODIFIERS = [
    // windows
    ["front window", UM_RECT_CORNERS_MODIFIER, UM_FRAME_FRONT, [25, 90, 0], [UM_X-50, UM_Z-130, UM_WALL, 20]],
    ["top window", UM_RECT_CORNERS_MODIFIER, UM_FRAME_TOP, [25, 45, 0], [UM_X-50, UM_Y-70, UM_WALL, 10]],
    ["left window", UM_RECT_CORNERS_MODIFIER, UM_FRAME_LEFT, [40+UM_WALL, 90, 0], [UM_Y-65-UM_WALL, UM_Z-130, UM_WALL, 20]],
    ["right window", UM_RECT_CORNERS_MODIFIER, UM_FRAME_RIGHT, [40+UM_WALL, 90, 0], [UM_Y-65-UM_WALL, UM_Z-130, UM_WALL, 20]],
    // rods
    ["left front rod gap", UM_CIRCLE_MODIFIER, UM_FRAME_FRONT, UM_LEFT_ROD_OFFSET, UM_ROD_GAP],
    ["left back rod gap", UM_CIRCLE_MODIFIER, UM_FRAME_BACK, UM_LEFT_ROD_OFFSET, UM_ROD_GAP],
    ["right front rod gap", UM_CIRCLE_MODIFIER, UM_FRAME_FRONT, UM_RIGHT_ROD_OFFSET, UM_ROD_GAP],
    ["right back rod gap", UM_CIRCLE_MODIFIER, UM_FRAME_BACK, UM_RIGHT_ROD_OFFSET, UM_ROD_GAP],
    ["front left rod gap", UM_CIRCLE_MODIFIER, UM_FRAME_LEFT, UM_FRONT_ROD_OFFSET, UM_ROD_GAP],
    ["front right rod gap", UM_CIRCLE_MODIFIER, UM_FRAME_RIGHT, UM_FRONT_ROD_OFFSET, UM_ROD_GAP],
    ["back left rod gap", UM_CIRCLE_MODIFIER, UM_FRAME_LEFT, UM_BACK_ROD_OFFSET, UM_ROD_GAP],
    ["back right rod gap", UM_CIRCLE_MODIFIER, UM_FRAME_RIGHT, UM_BACK_ROD_OFFSET, UM_ROD_GAP],
    // Z-bed RODS
    ["Z motor gap", UM_MOTOR_MODIFIER, UM_FRAME_BOTTOM, [UM_X*0.5, UM_MOTOR_SIZE*0.5+UM_WALL, 0], [0,0,0]],
    ["Z left rod", UM_CIRCLE_MODIFIER, UM_FRAME_BOTTOM, [UM_X*0.5-UM_PRINT_AREA[0]*0.5+20, UM_Z_ROD_OFFSET+UM_WALL, 0], UM_Z_ROD_GAP],
    ["Z left rod", UM_CIRCLE_MODIFIER, UM_FRAME_TOP, [UM_X*0.5-UM_PRINT_AREA[0]*0.5+20, UM_Z_ROD_OFFSET+UM_WALL, 0], UM_Z_ROD_GAP],
    ["Z right rod", UM_CIRCLE_MODIFIER, UM_FRAME_BOTTOM, [UM_X*0.5+UM_PRINT_AREA[0]*0.5-20, UM_Z_ROD_OFFSET+UM_WALL, 0], UM_Z_ROD_GAP],
    ["Z right rod", UM_CIRCLE_MODIFIER, UM_FRAME_TOP, [UM_X*0.5+UM_PRINT_AREA[0]*0.5-20, UM_Z_ROD_OFFSET+UM_WALL, 0], UM_Z_ROD_GAP],
    // Y Motor
    ["Y motor gap", UM_MOTOR_MODIFIER, UM_FRAME_LEFT, [UM_WALL+UM_MOTOR_SIZE*0.5, UM_BACK_ROD_OFFSET[1]-UM_Y_MOTOR_OFFSET, 0], [0,4,0]],
    // X Motor
    ["X motor gap", UM_MOTOR_MODIFIER, UM_FRAME_BACK, [UM_X-UM_WALL-UM_MOTOR_SIZE*0.5-6, UM_RIGHT_ROD_OFFSET[1]-UM_X_MOTOR_OFFSET, 0], [0,4,0]],
    // E Motor
    ["E motor gap", UM_MOTOR_MODIFIER, UM_FRAME_BACK, [UM_WALL+UM_MOTOR_SIZE*0.5, UM_BACK_ROD_OFFSET[1]-UM_Y_MOTOR_OFFSET-UM_MOTOR_SIZE-10, 0], [0,0,0]],
    // basement
    ["front gap", UM_RECT_CORNERS_MODIFIER, UM_FRAME_FRONT, [30, -20, 0], [UM_X-60, 30, UM_WALL, 10]],
    //["back gap", UM_RECT_CORNERS_MODIFIER, UM_FRAME_BACK, [30, -20, 0], [UM_X-60, 30, UM_WALL, 10]],
    ["left gap", UM_RECT_CORNERS_MODIFIER, UM_FRAME_LEFT, [30, -20, 0], [UM_Y-60, 30, UM_WALL, 10]],
    ["right gap", UM_RECT_CORNERS_MODIFIER, UM_FRAME_RIGHT, [30, -20, 0], [UM_Y-60, 30, UM_WALL, 10]]
    
];


module UMDrawRectModifier(offset, size){
    translate(offset + [0,0,-0.1]){
        scale([1,1,1.2]) cube(size, center = false);
    }
}

module UMDrawRectCornersModifier(offset, size){
    translate(offset + [0,0,-0.1]){
        scale([1,1,1.2]) {
            x = size[0];
            y = size[1];
            z = size[2];
            d = size[3];
            points = [
                [0, d], [0, y-d],
                [d, y], [x-d, y],
                [x, y-d], [x, d],
                [x-d, 0], [d, 0]
            ];
            linear_extrude(z) polygon(points);
        }
        
        
    }
}



module UMDrawCircleModifier(offset, size){
    translate(offset + [0,0,-0.1]){
        scale([1,1,1.2]) 
        {
            cylinder(UM_WALL, d=size, center = false);
        }
    }
}

module UMDrawMotorModifier(offset, size){
    translate(offset + [0,0,-0.1]){
        scale([1,1,1.2]) 
        {
            delta = UM_MOTOR_SIZE*0.5 - UM_MOTOR_SCREW_OFFSET;
            
            UMDrawCapsule(UM_MOTOR_GAP, size);
            translate ([-delta, -delta]) UMDrawCapsule(UM_SREW_GAP, size);
            translate ([-delta, delta]) UMDrawCapsule(UM_SREW_GAP, size);
            translate ([delta, delta]) UMDrawCapsule(UM_SREW_GAP, size);
            translate ([delta, -delta]) UMDrawCapsule(UM_SREW_GAP, size);
            
        }
        
    }
}

module UMDrawCapsule(size, h){
    union(){
        translate(-h/2) 
            cylinder(UM_WALL, d=size, center = false);    
        translate(h/2) 
            cylinder(UM_WALL, d=size, center = false);    
        
        if (h[0] > 0){
            translate ([0, 0, UM_WALL/2]) 
                cube([h[0], size, UM_WALL], center = true);
        } 
        if (h[1] > 0){
            translate ([0, 0, UM_WALL/2]) 
            cube([size, h[1], UM_WALL], center = true);
        }
    }
    
}


module UMDrawModifiers(frame){
    for(modifier = [0:len(UM_MODIFIERS)-1]){
        if (UM_MODIFIERS[modifier][2] == frame){
            if (UM_MODIFIERS[modifier][1] == UM_RECT_MODIFIER)
            {
                UMDrawRectModifier(UM_MODIFIERS[modifier][3], UM_MODIFIERS[modifier][4]);
            } 
            else if (UM_MODIFIERS[modifier][1] == UM_CIRCLE_MODIFIER)
            {
                UMDrawCircleModifier(UM_MODIFIERS[modifier][3], UM_MODIFIERS[modifier][4]);
            } 
            else if (UM_MODIFIERS[modifier][1] == UM_MOTOR_MODIFIER)
            {
                UMDrawMotorModifier(UM_MODIFIERS[modifier][3], UM_MODIFIERS[modifier][4], UM_MODIFIERS[modifier][5]);
            } 
            else if (UM_MODIFIERS[modifier][1] == UM_RECT_CORNERS_MODIFIER)
            {
                UMDrawRectCornersModifier(UM_MODIFIERS[modifier][3], UM_MODIFIERS[modifier][4]);
            } 
        }
    }
}

module UMDrawFrame(frame){
    translate(UM_FRAME_OFFSETS[frame])
    {
        rotate(UM_FRAME_ROTATIONS[frame])
        {
            difference (){
                color(UM_COLORS[frame]) cube(UM_FRAME_SIZES[frame]);
                UMDrawModifiers(frame);
            }
        }
    }
}
module UMDrawFrames(){
    for (frame = [0:UM_FRAMES_COUNT-1]){
       UMDrawFrame(frame); 
    }
}

UMDrawFrames();
translate([UM_X/2, -UM_Y/2, UM_Z - UM_WALL - UM_ROD_MAX*1.5]) UMDrawHotend();

translate([UM_X/2, -UM_Y/2-10, UM_Z - 90]) color("Orange") cube([UM_PRINT_AREA[0], UM_PRINT_AREA[1], 1], center = true);



