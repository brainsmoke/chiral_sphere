$fn=50;
e=.001;

height=6;
depth=35;
pitch = 5;
n_cables=4;

border_r = 3;
side_border=2.9;
inner_wall_thickness=.8;
bottom_thickness = .6;

cable_d=1.5;
screw_d=3.2;
screw_wall_margin=2.5;
screw_head=5.9;
screw_head_border = .6;
screw_head_depth=1;

print_separation=2;

n_screws_per_side = ceil(n_cables/2);

dim = [2*side_border+n_cables*pitch-inner_wall_thickness,depth,height];
cavity_dim = [ pitch - inner_wall_thickness, dim.y - 4*screw_wall_margin, dim.z-2*bottom_thickness ] ;

module do_center(dim, center)
{
	if (center)
		translate(-dim/2)
			children();
	else
		children();
}

module rounded_box(dim, r, center=false)
{
	do_center(dim, center)
	hull()
	{
		for (x=[r,dim.x-r])
		for (y=[r,dim.y-r])
		translate([x,y,0])
        cylinder(h=dim.z,r=r);
	}
}

module at_cables()
{
	for (i=[0:n_cables-1])
	{
		dx = pitch*(  i-(n_cables-1)/2 );
		translate([dx, 0,0])
		children();
	}
}

module cable()
{
	rotate([90,0,0])
	cylinder(dim.y+2*e, d=cable_d, center=true);
}


module at_screws()
{
	y_off = dim.y/2 - screw_wall_margin;
	for (i=[0:n_screws_per_side-1])
	{
		x = 2*pitch*i - pitch*(n_cables/2-1);
		for (y=[-y_off,y_off])
		translate([x,y,0])
		children();
	}
}

module hex_prism(h, r)
{
	cylinder(h=h, r=r*2/sqrt(3), $fn=6);
}

module clamp()
{
	difference()
	{
		rounded_box(dim, r=border_r, center=true);

		difference()
		{
			at_cables()
			{
				cube(cavity_dim, center=true);
				cable();
			}

			at_screws()
			translate([0,0,-dim.z/2-e])
			hex_prism(screw_head_depth+bottom_thickness + e, screw_head/2+screw_head_border);
		}

		at_screws()
		translate([0,0,-dim.z/2-e])
		{
			cylinder(h=dim.z+2*e,d=screw_d);
			hex_prism(screw_head_depth+e, r=screw_head/2);
		}
	}
}

module split()
{
	translate([-(dim.x+e)/2, -(dim.y+e)/2, 0])
	cube([dim.x+e, dim.y+e, dim.z/2+e]);
}

module top()
{
	intersection()
	{
		children();
		split();
	}
}

module bottom()
{
	difference()
	{
		children();
		split();
	}
}

module flip()
{
	rotate([180,0,0])
	children();
}

module next()
{
	translate([dim.x+print_separation,0,0])
	children();
}

flip()
top()
clamp();

next()
bottom()
clamp();

