// untested

e=.001;

jig_h=9;
tunnel_w=33.5;
m=.15;
plug_w=12.8;
plug_h=5.2;
plug_d=7.6;
clamp_w=5;
clamp_h=2;
pcb_w=25;
pcb_h=1.6;
front_d=15;
border=1.2;
push_border=.8;

jig_d=30;

conn_w=15.6;
conn_clearance_h=8;
conn_d=10;

module midx_cube(pos)
{
	translate([-pos.x/2, 0, 0])
	cube(pos);
}

module hat()
{
difference()
{
midx_cube([tunnel_w, jig_d, jig_h]);
for (x=[-1,1])
{
	translate([x*19.2,-e,border])
		midx_cube([20,jig_d+1,20]);

}
}

difference()
{
translate([0,0,-pcb_h])
midx_cube([pcb_w+2*m+border*2, jig_d, pcb_h+e]);
translate([0,-e,-pcb_h-e])
midx_cube([pcb_w+2*m, jig_d+2*e, pcb_h+2*e]);

}

}

difference()
{
union()
{
hat();
intersection()
{
hull()hat();
union()
{
translate([0,-e,-e])
midx_cube([tunnel_w+1, push_border+e, jig_h+1]);
translate([0,jig_d-push_border,-e])
midx_cube([tunnel_w+1, push_border+e, jig_h+1]);

}
}
}
translate([0,-e,-e])
{
midx_cube([plug_w+2*m,front_d+plug_d+e*2,plug_h+e]);
difference()
{
midx_cube([clamp_w+2*m,front_d+plug_d+2*e,clamp_h+plug_h+e]);
translate([0,front_d+1,clamp_h+plug_h-2])
midx_cube([clamp_w+1+2*m,1,2+e]);

}
}


translate([0, front_d+plug_d,-e])
midx_cube([conn_w+3*m, conn_d, conn_clearance_h+e]);


translate([0,2,8.2])
rotate([45,0,0])
midx_cube([20,2,2]);
}
