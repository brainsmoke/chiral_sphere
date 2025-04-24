e=.001;
xt30_w=11.4;
xt30_h=6.2;
b=.8;
n=1.2;
xt30_n=1.5;

rj45_w=12;
rj45_h=8;

jig_h=13;

module keepout(w, h, b, n)
{
translate([0,0,jig_h-7])
linear_extrude(8+e)
	translate([b,b])
	polygon([[0,0], [w,0], [w,h], [w-n,h], [w-n,h+b+e], [n,h+b+e], [n, h], [0,h]]);
}

module xt_keepout(w, h, b, n, ch)
{
translate([0,0,jig_h-8])
linear_extrude(8+e)
	translate([b,b])
	polygon([[0,0], [w-ch,0], [w, ch], [w,h-ch], [w-n,h], [w-n,h+b+e], [n,h+b+e], [n, h], [0,h]]);
}


module xt_clam()
{
{
	difference()
	{
		linear_extrude(jig_h)
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
		linear_extrude(jig_h)
			square([rj45_w+b*2,rj45_h+b*2]);
		keepout(rj45_w, rj45_h, b, n);
	}
}
}

difference()
{
union(){
translate([1.8,rj45_h-xt30_h,0])
xt_clam();
translate([17.2,0,0])
rj45_clam();
translate([1.8,0,0])
cube([29,10,1.8]);

for (y=[1.8, 8.8])
translate([14.25,y,0])
cube([3.5,.8,jig_h]);

}
union(){
translate([1.8+b+n,rj45_h-xt30_h+b*2,-e])
cube([xt30_w-2*n,12,e*2+jig_h-8]);

translate([17.2+b+n,b*2,-e])
cube([rj45_w-2*n,12,e*2+jig_h]);
}
}
