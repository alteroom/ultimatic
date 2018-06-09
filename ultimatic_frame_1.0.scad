// ultimatic by Aleksandr Petrov
$fn = 40;
// size of frame
UM_X = 250;
UM_Y = 270;
UM_Z = 330;
UM_SIZE = [UM_X, UM_Y, UM_Z];
// 6 mm plywood frame walls width
UM_WALL = 6;
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
UM_LEFT_ROD_OFFSET = [UM_ROD_MAX, UM_Z - UM_WALL - UM_ROD_MAX*0.5, 0];
UM_RIGHT_ROD_OFFSET = [UM_X - UM_ROD_MAX, UM_Z - UM_WALL - UM_ROD_MAX*0.5, 0];
UM_BACK_ROD_OFFSET = [UM_WALL + UM_ROD_MAX*1.5, UM_Z - UM_WALL - UM_ROD_MAX*1.5, 0];
UM_FRONT_ROD_OFFSET = [UM_Y - UM_WALL - UM_ROD_MAX*0.5, UM_Z - UM_WALL - UM_ROD_MAX*1.5, 0];
// screw
UM_SREW_GAP = 3;
// motors
UM_MOTOR_GAP = 20;
UM_MOTOR_SIZE = 40;
UM_MOTOR_SCREW_OFFSET = 5;
UM_Z_ROD_GAP = 12;
UM_Z_ROD_GAP2 = 21;
// modifiers
UM_RECT_MODIFIER = "rect";
UM_CIRCLE_MODIFIER = "circle";
UM_MOTOR_MODIFIER = "motor";

// [name, type, frame_id, offset, size, size2]
UM_MODIFIERS = [
    // windows
    ["front window", UM_RECT_MODIFIER, UM_FRAME_FRONT, [20, 75, 0], [210, 220, UM_WALL]],
    ["top window", UM_RECT_MODIFIER, UM_FRAME_TOP, [30, 50, 0], [190, 190, UM_WALL]],
    ["left window", UM_RECT_MODIFIER, UM_FRAME_LEFT, [50, 75, 0], [190, 220, UM_WALL]],
    ["right window", UM_RECT_MODIFIER, UM_FRAME_RIGHT, [50, 75, 0], [190, 220, UM_WALL]],
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
    ["Z motor gap", UM_MOTOR_MODIFIER, UM_FRAME_BOTTOM, [UM_X*0.5, UM_WALL+UM_MOTOR_SIZE*0.5, 0], [0,0,0]],
    ["Z left rod", UM_CIRCLE_MODIFIER, UM_FRAME_BOTTOM, [UM_X*0.5-50, UM_WALL+UM_MOTOR_SIZE*0.5, 0], UM_Z_ROD_GAP],
    ["Z left rod", UM_CIRCLE_MODIFIER, UM_FRAME_TOP, [UM_X*0.5-50, UM_WALL+UM_MOTOR_SIZE*0.5, 0], UM_Z_ROD_GAP],
    ["Z right rod", UM_CIRCLE_MODIFIER, UM_FRAME_BOTTOM, [UM_X*0.5+50, UM_WALL+UM_MOTOR_SIZE*0.5, 0], UM_Z_ROD_GAP],
    ["Z right rod", UM_CIRCLE_MODIFIER, UM_FRAME_TOP, [UM_X*0.5+50, UM_WALL+UM_MOTOR_SIZE*0.5, 0], UM_Z_ROD_GAP],
    // X Motor
    ["X motor gap", UM_MOTOR_MODIFIER, UM_FRAME_LEFT, [UM_WALL+UM_MOTOR_SIZE*0.5, UM_BACK_ROD_OFFSET[1]-70, 0], [0,6,0]],
    // Y Motor
    ["Y motor gap", UM_MOTOR_MODIFIER, UM_FRAME_BACK, [UM_X-UM_WALL-UM_MOTOR_SIZE*0.5-6, UM_RIGHT_ROD_OFFSET[1]-70, 0], [0,6,0]],
    // E Motor
    ["E motor gap", UM_MOTOR_MODIFIER, UM_FRAME_RIGHT, [UM_WALL+UM_MOTOR_SIZE*0.5, UM_RIGHT_ROD_OFFSET[1]-130, 0], [0,0,0]]
    
];

// print area
UM_PRINT_AREA = [150, 150];
// print area borders
UM_PRINT_BORDERS = [10, 10];
// Hot Bed Size
UM_HOTBED_SIZE = [
    UM_PRINT_AREA[0]+2*UM_PRINT_BORDERS[0], 
    UM_PRINT_AREA[1]+2*UM_PRINT_BORDERS[1]
];

module UMDrawRectModifier(offset, size){
    translate(offset + [0,0,-0.1]){
        scale([1,1,1.2]) cube(size, center = false);
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
        }
    }
}

module UMDrawFrame(frame){
    translate(UM_FRAME_OFFSETS[frame])
    {
        rotate(UM_FRAME_ROTATIONS[frame])
        {
            difference (){
                cube(UM_FRAME_SIZES[frame]);
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





