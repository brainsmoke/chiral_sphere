
difference()
{
	linear_extrude(height=10.5)
	import("power_insert.svg");

	translate([0,0,.8])
	linear_extrude(height=10.5)
	offset(delta=-1.5)
	import("power_insert.svg");
}
