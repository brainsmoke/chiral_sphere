// ./volume.py -scad -r 570.902313 -height 45.3 -width 40.5 -subdivisions 3 [ r = 570.902313 ]

r = 570.902313;
w = 40.5;
h = 45.3;
$wmargin=.2;
$hmargin=.2;
$margin_overlap=.001;
subdivisions = 3;



module subdiv_arc(a, n)
{
    if (n > 0)
        rotate([0,0,a])
        {
            children();
            subdiv_arc(a,n-1)children();
        }
}

module joint()
{
    translate([r,0,0])
    rotate([0,90,0])
    rotate([0,0,90-A])
    joint_volume();
}

module subdiv()
{
    translate([r,0,0])
    rotate([0,90,0])
    rotate([0,0,90])
    div_volume();
}


module arc()
{
    joint();

    subdiv_arc(alpha/2/subdivisions, subdivisions-1)subdiv();

    rotate([-A,0,0])
    subdiv_arc(alpha/2/subdivisions, subdivisions-1)subdiv();
}




/*
* alpha = 2*beta
* cos (alpha) = 1 / (1-cos(A)) - 1
* cos (beta)  = (phi + 1) / (1+cos(A)) - 1
*
* let x = cos(A)
*
* 1 / (1-x) -1 = 2 * ( (phi + 1)/(1+x) - 1 )^2 - 1
*
* x^3+(-2*phi-1/2)x^2+(3*phi+2)x + (-phi-1/2) = 0
*/

phi=(1+sqrt(5))/2;
cuberoot=pow(118*phi+85+6*sqrt(1173*phi+729), 1/3);
cos_A=(1/6)*(4*phi+1) +
      (1/6)*(12*phi+7)/cuberoot -
      (1/6)*cuberoot;

A=acos(cos_A);

cos_alpha=1/(1-cos_A)-1;
alpha=acos(cos_alpha);

module step_x()
{
   rotate([0,0,alpha/2])rotate([A,0,0])
   children();
}

module step_y()
{
   rotate([0,0,3*alpha/2])rotate([180,0,0])
   children();
}

module penta()
{
   children();
   step_x(){
	   children();
	   step_x(){
		   children();
		   step_x(){
			   children();
			   step_x(){
				   children();
			   }
		   }
	   }
   }
}

module extend()
{
   children();
   step_y()step_x()step_x()step_x()
   {
	   penta()children();
	   step_y(){
		   penta()children();
		   step_x()step_x()step_y()children();
	   }
   }
}

module joint_volume ()
{
minkowski()
{
extra = sin(alpha/2/subdivisions);

cube([2*($margin_overlap+extra), $wmargin*2, $hmargin*2], center=true);

	polyhedron([[-43.49514676774067, -20.25, 0],[-43.49514676774067, 20.25, 0],[-13.579977013531076, 20.25, 0],[-2.2250455747644047, 47.92639632329478, 0],[35.24403985256161, 32.55377009223895, 0],[30.19611149499105, 20.25, 0],[43.49514676774067, 20.25, 0],[43.49514676774067, -20.25, 0],[-40.04389056556331, -20.25, -45.3],[-40.04389056556331, 20.25, -45.3],[-13.579977013531076, 20.25, -45.3],[-3.535042404978869, 44.73342315117201, -45.3],[33.93404302234715, 29.36079692011618, -45.3],[30.19611149499105, 20.25, -45.3],[40.04389056556331, 20.25, -45.3],[40.04389056556331, -20.25, -45.3]],[[0,1,2,3,4,5,6,7],[15,14,13,12,11,10,9,8],[1,0,8,9],[2,1,9,10],[3,2,10,11],[4,3,11,12],[5,4,12,13],[6,5,13,14],[7,6,14,15],[0,7,15,8]]);
}
}

module div_volume ()
{
minkowski()
{
extra = sin(alpha/2/subdivisions);

cube([2*($margin_overlap+extra), $wmargin*2, $hmargin*2], center=true);

	polyhedron([[-43.49514676774067, -20.25, 0],[-43.49514676774067, 20.25, 0],[43.49514676774067, 20.25, 0],[43.49514676774067, -20.25, 0],[-40.04389056556331, -20.25, -45.3],[-40.04389056556331, 20.25, -45.3],[40.04389056556331, 20.25, -45.3],[40.04389056556331, -20.25, -45.3]],[[0,1,2,3],[7,6,5,4],[1,0,4,5],[2,1,5,6],[3,2,6,7],[0,3,7,4]]);
}
}
