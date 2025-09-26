
border=2;


include <big_solid.scad>

/*
 
phi=(1+sqrt(5))/2;
cuberoot=pow(118*phi+85+6*sqrt(1173*phi+729), 1/3);
cos_A=(1/6)*(4*phi+1) +
     (1/6)*(12*phi+7)/cuberoot -
     (1/6)*cuberoot;
 
A=acos(cos_A);
 
cos_alpha=1/(1-cos_A)-1;
alpha=acos(cos_alpha);

*/

sin_center = sin(360/5);
sin_c_opp = sin(alpha/2);
sin_equa = sin((180-A)/2);

sin_mid = sin_equa*sin_c_opp/sin_center;

mid = asin(sin_mid);

echo(sin_center, sin_c_opp, sin_equa, sin_mid);

module center_rotation()
{
rotate([72,0,0])
rotate([0,0,-mid])
rotate([-90+A/2,0,0])
children();
}


module center_scene()
{
	translate([-r+h/2,0,65])
rotate([+A/2,0,0])
rotate([0,0,mid])
rotate([-72,0,0])
	children();
}

module lamp()
{
union()
	center_rotation()
	penta()extend()
arc();
}


module lamp_fragment()
{
union()
	center_rotation()
//	penta()extend()
arc();
}

module cubeoffset(w)
{
center_rotation()
rotate([-A,0,0])
cube(w*2, center=true);

}


module base_block()
{
	center_rotation()
	rotate([-A,0,0])
	translate([540,66.3,0])
	cube([70,68.6,45], center=true);
}

module rotated_block()
{
	center_rotation()
	rotate([-A,0,0])
	rotate([0,0,alpha/2/subdivisions-1.6])
	translate([540,-5.2,0])
	cube([70,69,100], center=true);

}

module guide_shape()
{
	cylinder(10, r=4., center=true);
}

module guide_holes()
{

minkowski()
{
				rotate([-5,0,0])
				rotate([0, 27.25,0])
				rotate([0,90,0])
cylinder(h=11, r=1.75, center=true, $fn=8);
difference()
{
slice(w=.01,$wmargin=3.31,$hmargin=1.75, $margin_overlap=.001);
slice(w=.02,$wmargin=3.3,$hmargin=1.76, $margin_overlap=.001);
}
}
}


module guide_bottom()
{
difference()
{
minkowski()
{
//				rotate([-5,0,0])
//				rotate([0, 27.25,0])
sphere(r=1.75, $fn=12);
difference()
{
slice(w=.01,$wmargin=3.3,$hmargin=5.51, $margin_overlap=.001);
slice(w=.02,$wmargin=3.4,$hmargin=5.5, $margin_overlap=.001);

}
}

			center_rotation()
			rotate([-A,0,0])
			translate([570,65,0])
			cube([40,73,80], center=true);
}
}


module slice(w=.01)
{
	intersection()
	{
		rotate([-5,0,0])
		rotate([0,27.25,0])
		translate([546,0,0])
		cube([60,w,80], center=true);
		lamp_fragment();
	}
}

module wire_guide()
{
intersection()
{
rotated_block();
	difference()
{
	difference()
	{
		union()
		{

			intersection()
			{
				lamp_fragment($wmargin=1.75, $hmargin=1.75, $margin_overlap=.01);
				base_block();
			}

			minkowski()
			{
				rotate([-5,0,0])
				rotate([0, 27.25,0])
				rotate([90,0,0])
				guide_shape();
				slice($wmargin=2.75, $hmargin=1.75, $margin_overlap=.1);
			}

		}

		union()
		{
			lamp_fragment($wmargin=.15, $hmargin=.15, $margin_overlap=.001);
			center_rotation()
			rotate([-A,0,0])
			translate([570,65,0])
			cube([30,73,36], center=true);
			guide_holes();
		}
	}

	guide_bottom();
}
}
}

center_scene()
{
	%lamp($wmargin=0.2);

	wire_guide();

}


//guide_shape();


