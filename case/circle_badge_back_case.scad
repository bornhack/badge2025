
/*
 * Case for BornHack 2025 badge
 *
 * Design: hxr.social/@thomasflummer
 *
 * License: CC-BY-SA
 *
 */

module half_rounded_cube(x, y, z, radius)
{
	hull()
	{
		for(xp = [-1, 1])
		{
			for(yp = [-1, 1])
			{
				for(zp = [-1, 1])
				{
					translate([xp*(x/2-radius), yp*(y/2-radius), zp*(z/2-0.1/2)])
						cylinder(r = radius, h = 0.1, center = true, $fn = 200);
				}
			}
		}
	}
}

module case()
{
	difference()
	{
		union()
		{
			hull()
			{
				translate([0, 0, -5/2+1.6])
					half_rounded_cube(100+2, 140+2, 5, 40+1);

				translate([0, 0, -16])
					half_rounded_cube(100-6, 140-6, 3, 40-3);
			}
			
			// extra sides for holding notches
			intersection()
			{
				translate([0, 0, 1.6])
					half_rounded_cube(100+2, 140+2, 10, 40+1);

				union()
				{
					for(xp = [-1, 1])
					{
						translate([xp*(100/2+0.1+1/2), 0, -100/2+1.6+2])
						rotate(90, [0, 1, 0])
							cylinder(d = 100, h = 1, center = true, $fn = 100);
					}
				}
			}
		}
		union()
		{
			// PCB cutout
			difference()
			{
				translate([0, 0, 1.6/2])
					half_rounded_cube(100+.2, 140+.2, 1.61, 40+0.1);

				difference()
				{
					translate([0, 0, 0])
						half_rounded_cube(40-.2, 80-.2, 40, 10-0.1);
						
					translate([0, 0, 0])
					rotate(-atan(20/50), [0, 0, 1])
						cube([29.8 + 0.2, 100, 40.1], center = true);
				}
			}

			// main opening
			difference()
			{
				hull()
				{
					translate([0, 0, -5/2+1.6])
						half_rounded_cube(100-2, 140-2, 5, 40-1);

					translate([0, 0, -16+1.5])
						half_rounded_cube(100-6-4, 140-6-4, 3, 40-3-2);
				}

				difference()
				{
					translate([0, 0, 0])
						half_rounded_cube(40+2, 80+2, 40, 10+1);
						
					translate([0, 0, 0])
					rotate(-atan(20/50), [0, 0, 1])
						cube([29.8+0.2, 100, 40.1], center = true);
				}
				
				// lanyard opening sides
				hull()
				{
					translate([0, 140/2, -5/2+1.6])
					rotate(35, [1, 0, 0])
						half_rounded_cube(10, 20, 30, 5);
					
				}
			}

			// lanyard cutout
			hull()
			{
				translate([0, 140/2, -5/2+1.6])
				rotate(35, [1, 0, 0])
					half_rounded_cube(8, 18, 30, 4);
				
			}

			// inner openings
			difference()
			{
				translate([0, 0, 0])
					half_rounded_cube(40-.2-2, 80-.2-2, 40, 10-0.1);
					
				translate([0, 0, 0])
				rotate(-atan(20/50), [0, 0, 1])
					cube([29.8 + 0.2 + 2, 100, 40.1], center = true);
			}
			
			// power switch
			translate([0, 0, 0])
			rotate(-atan(20/50), [0, 0, 1])
			translate([29.8/2+1.5, -6, 0])
			rotate(-15, [0, 1, 0])
				half_rounded_cube(4, 6, 12, 2);

			// USB-C cutout
			translate([0, -140/2, -3.2/2])
			rotate(90, [1, 0, 0])
				half_rounded_cube(9.2, 3.2, 20, 1.2);

			hull()
			{
				translate([0, -140/2+10/2, -3.2/2])
				rotate(90, [1, 0, 0])
					half_rounded_cube(9.2, 3.2, 10, 1.2);

				translate([0, -140/2+10/2, -3.2/2+3])
				rotate(90, [1, 0, 0])
					half_rounded_cube(9.2, 3.2, 10, 1.2);
			}

			// wall mounting hole
			translate([0, 140/2-20, -16])
				cylinder(d = 10, h = 10, center = true, $fn = 100);

			translate([0, 140/2-20, -16])
			hull()
			{
				cylinder(d = 4.5, h = 10, center = true, $fn = 100);

				translate([0, 8, 0])
					cylinder(d = 4.5, h = 10, center = true, $fn = 100);
			}
		}
	}
	
	// holding nothches
	union()
	{
		for(xp = [-1, 1])
		{
			translate([xp*(100/2+0.2), 0, 1.6+0.4])
			hull()
			{
				for(yp = [-1, 1])
				{
					translate([0, yp*2, 0])
						#sphere(d = 1, $fn = 50);
				}
			}
		}
	}

}

difference()
{
	union()
	{
		color("#ffafc7")
		case();

		if(true)
		{
			//color("#ffffff")
			translate([-100/2, 140/2, 0])
				%import("circle-badge.stl");
		}
	}
	union()
	{
		if(false)
		{
			rotate(55, [0, 0, 1])
			translate([0, -100, 0])
				cube([200, 200, 200], center = true);
		}
	}
}
