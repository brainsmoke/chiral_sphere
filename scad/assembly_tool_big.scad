e=.001;
xt32_w=11.2;
xt32_h=6.5;
b=.8;
n=1.2;

rj45_w=12;
rj45_h=8;


module keepout(w, h, b, n)
{
translate([0,0,12])
linear_extrude(8+e)
	translate([b,b])
	polygon([[0,0], [w,0], [w,h], [w-n,h], [w-n,h+b+e], [n,h+b+e], [n, h], [0,h]]);
}

module xt_keepout(w, h, b, n, ch)
{
translate([0,0,11])
linear_extrude(8+e)
	translate([b,b])
	polygon([[0,ch],[ch,0], [w,0], [w,h], [w-n,h], [w-n,h+b+e], [n,h+b+e], [n, h], [ch,h], [0,h-ch]]);
}


module xt_clam()
{
{
	difference()
	{
linear_extrude(19)
		square([xt32_w+b*2,xt32_h+b*2]);
		xt_keepout(xt32_w, xt32_h, b, n, n);
	}
}
}

module rj45_clam()
{
{
	difference()
	{
linear_extrude(19)
		square([rj45_w+b*2,rj45_h+b*2]);
		keepout(rj45_w, rj45_h, b, n);
	}
}
}

//cube([33,10,9+e]);
//translate([0,0,9])

difference()
{
union(){
translate([2,rj45_h-xt32_h])
xt_clam();
translate([17.2,0])
rj45_clam();
translate([-12,-1,0])
cube([60,12,1.6]);
}
union(){
translate([2+b+n,rj45_h-xt32_h+b*2,-e])
cube([xt32_w-2*n,12,e*2+11]);
translate([17.2+b+n,b*2,-e])
cube([rj45_w-2*n,12,e*2+12]);
}
}