e=.001;
$fn=20;

w=17.8;
h=21;
d=25;
th=2.5;

eye_h=10;
total_h=70;

xt60w=8;

wire_w=4;

module basic_shape()
{
translate([0,0,-th-w/2])
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
rotate([0,90,0])
translate([0,0,(-d-th)/2])
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
translate([0, total_h-th-wire_w/2, i*(w/2+th-xt60w/2)])
rotate([0,90,0])
cylinder(w+th*2+2*e,r=wire_w/2,center=true);
}

module wire_cut_out()
{
translate([0,0,-w/2-th-e])
linear_extrude(w+th*2+e*2)
hull()
{
	for (i=[7,40])
	translate([0,i])
	circle(r=wire_w/2);
}

}

difference(){
basic_shape();
union()
{
cut_out();
wire_cut_out();
holes();
}

}
