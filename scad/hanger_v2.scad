e=.001;
$fn=20;

w=17.8;
h=21;
d=25;
th=2.5;

eye_h=10;
total_h=70;

xt60w=8;
xt60_chamfer=2.5;

clamp_th=13;
clamp_height=40;

wire_w=4;

cable_w=8;
clamp_gap=.3;

module xt60(h,e=0)
{
	linear_extrude(h)
	polygon([[8+e, -4-e], [-8+xt60_chamfer-e, -4-e], [-8-e, -4+xt60_chamfer-e], [-8-e, 4-xt60_chamfer+e], [-8+xt60_chamfer-e, 4+e], [8+e, 4+e]]);
}

module cable_cutout()
{
	translate([0,0,23.5])
	cylinder(h=100.5,r=cable_w/2);
}

module xt60_cutout(h,r=2)
{
	intersection()
	{
		xt60(h+r,e);
		union(){
		translate([-8-e, -4-e, 0])
		cube([16+2*e, 8+2*e, h]);
		translate([-8-e, 0, h])
		rotate([0,90,0])
		hull(){
		translate([0,-4+r,0])
		cylinder(16, r=r);
		translate([0,4-r,0])
		cylinder(16, r=r);
		}
	}}
}

module basic_shape()
{
translate([0,th+w/2,0])
rotate([90,0,0])
linear_extrude(w+th*2)
offset(th/2)polygon(
	[
		[-d/2, -th/2],
			/*[-e, total_h-eye_h],*/ [-e, total_h-th/2],
			[e, total_h-th/2], /* [e, total_h-eye_h],*/
		[d/2,-th/2]
	]);
}


module cut_out()
{
translate([(-d-th)/2,0,0])
rotate([90,0,90])
linear_extrude(d+th)
polygon(
	[
		[-w/2, 0], [-w/2, h],
			[-xt60w/2, total_h-eye_h], [-xt60w/2, total_h+e],
			[xt60w/2, total_h+e], [xt60w/2, total_h-eye_h],
		[w/2, h], [w/2,0]
	]);
}


module holes()
{
for (i=[1,-1])
translate([0, i*(w/2+th-xt60w/2), total_h-th-wire_w/2])
rotate([90,0,90])
cylinder(w+th*2+2*e,r=wire_w/2,center=true);
}

module wire_cut_out()
{
translate([0,w/2+th+e,0])
rotate([90,0,0])
linear_extrude(w+th*2+e*2)
hull()
{
	for (i=[7,40])
	translate([0,i])
	circle(r=wire_w/2);
}

}

module hanger()
{

difference(){
basic_shape();
union()
{
cut_out();
wire_cut_out();
holes();
}

}

}

module clamp_gap_cutout()
{
x=clamp_gap;
y=w/2+th+e;
translate([-x,-y,60])
cube([x*2,y*2, clamp_height+2*e]);
}



module clamp_base_shape(r=1)
{
x=clamp_th/2-r;
y=w/2+th-e-r;
translate([0,0,60])
linear_extrude(clamp_height)
hull()
for(pos =[[-x,-y], [x, -y], [x, y], [-x, y]])
translate(pos)
circle(r);
}

module clamp()
{
difference()
{
clamp_base_shape();
union()
{
translate([0,0,50])
{
xt60_cutout(34);
cable_cutout();
}
clamp_gap_cutout();
translate([0,0,28])
holes();
basic_shape();
holes();
}
}
}

module clamp_half()
{

intersection()
{
	clamp();

{
x=clamp_th/2;
y=w/2+th+e;
translate([0,-y,60-e])
cube([x,y*2+e, clamp_height+2*e]);
}
}
}

//clamp_half();
hanger();