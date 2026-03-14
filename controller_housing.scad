// SPDX-License-Identifier: MIT

include <YAPP_Box/YAPPgenerator_v3.scad>

// Housing for Bluesound controller
// Components:
//   LiPoly Battery - 34mm x 62mm - determines the length of the project
//   4 Key NeoPixel Keyboard  - 76.5mm x 21mm - determines the width of the project
//   Rotary encoder board  - 25.6mm x 25.3mm x 4.6mm - Encoder dimensions 14.38mm x 12.72 _stepper_motor_mount
//      Knob diameter 6.93mm
//   Feather ESP32-S3 - 52.3mm x 22.7mm x 2.1mm

printBaseShell = true;
printLidShell  = true;
showPCB = true;

pcbLength = 52.3; // Front to back
pcbWidth = 22.7; // Side to side
pcbThickness = 2.1;

//-- padding between pcb and inside wall
paddingFront = 5;
paddingBack = 5;
paddingRight = 5;
paddingLeft = 5;

wallThickness = 2.4;
basePlaneThickness = 4.0;
lidPlaneThickness = 2;

baseWallHeight = 15;
lidWallHeight = 20;

ridgeHeight = 5;
ridgeSlack = 0.2;
roundRadius = 0.1;

standoffHeight = 5;  //-- used for PCB Supports, Push Button and showPCB
standoffDiameter= 5;
standoffPinDiameter = 2;
standoffHoleSlack = 0.4;

pcb = [
   ["Main", pcbWidth, pcbLength, 0, 0, pcbThickness, standoffHeight, standoffDiameter, standoffPinDiameter, standoffHoleSlack]
   ,["Battery", 34, 62, pcbWidth + 2, 8, 5, 0, 0, 0, 0, 0]
];

pcbStands = [
   [2, 2, yappAllCorners]
   ,[37, 17, 29, yappLidOnly, yappHole, yappSelfThreading, yappNoFillet]   // Left back keyboard
   ,[59, 17, 29, yappLidOnly, yappHole, yappSelfThreading, yappNoFillet]   // Left front keyboard
   ,[37, 53, 29, yappLidOnly, yappHole, yappSelfThreading, yappNoFillet]   // Right back keyboard
   ,[59, 53, 29, yappLidOnly, yappHole, yappSelfThreading, yappNoFillet]   // Right front keyboard
   ,[7, 18, 25, yappLidOnly, yappHole, yappSelfThreading, yappNoFillet]    // Left back rotary
   ,[7, 36, 25, yappLidOnly, yappHole, yappSelfThreading, yappNoFillet]    // Right back rotary
   ,[25, 18, 25, yappLidOnly, yappHole, yappSelfThreading, yappNoFillet]    // Left front rotary
   ,[25, 36, 25, yappLidOnly, yappHole, yappSelfThreading, yappNoFillet]    // Right front rotary
   ];

cutoutsBase = [
   [ 55 / 2 + 15, 76.5 / 2 - 5, 30, 40, 0, yappRectangle, maskHoneycomb, yappCenter]
   ];

cutoutsLeft = [
   [10, 3.5,  12, 8, 0, yappRectangle, yappCenter, yappCoordPCB]
   ];

cutoutsLid = [
   [40, -1, 16, 72 , 0, yappRectangle]
   ,[10, 20, 0, 0, 7, yappCircle]
   ];

snapJoins = [
   [shellLength / 2, 5, yappLeft, yappRight, yappSymmetric, yappRectangle]
   ,[shellWidth / 2, 5, yappFront, yappBack, yappSymmetric, yappRectangle]
   ];

labelsPlane = [
   [38, 21, 90, 1, yappLid, "Liberation Mono:style=bold", 4, "VOL/MUTE"]
   ,[67, 6, 90, 1, yappLid, "liberation Mono:style=bold", 3, "OPTICAL"]
   ,[67, 28, 90, 1, yappLid, "liberation Mono:style=bold", 3, "HDMI"]
   ,[67, 66, 90, 1, yappLid, "liberation Mono:style=bold", 3, "ALOHA"]
   ,[71, 68, 90, 1, yappLid, "liberation Mono:style=bold", 3, "JOE"]
   ];

YAPPgenerate();