e=.001;
xt30_w=11.4;
xt30_h=6.2;
b=.8;
n=1.2;
xt30_n=1.5;

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
	polygon([[0,0], [w-ch,0], [w, ch], [w,h-ch], [w-n,h], [w-n,h+b+e], [n,h+b+e], [n, h], [0,h]]);
}


module xt_clam()
{
{
	difference()
	{
linear_extrude(17)
		square([xt30_w+b*2,xt30_h+b*2]);
		xt_keepout(xt30_w, xt30_h, b, xt30_n, xt30_n);
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
translate([1.8,rj45_h-xt30_h])
xt_clam();
translate([17.2,0])
rj45_clam();
translate([-4,-1,0])
cube([40,12,1.8]);
}
union(){
translate([1.8+b+n,rj45_h-xt30_h+b*2,-e])
cube([xt30_w-2*n,12,e*2+11]);
translate([1.9+b,rj45_h-xt30_h+b*2,-e])
cube([xt30_w,6,9]);

translate([17.2+b+n,b*2,-e])
cube([rj45_w-2*n,12,e*2+12]);
}
}