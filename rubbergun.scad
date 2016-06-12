$fa=0.5;
$fs=0.5;

r = 2.8;
bl = 145;

module half() {

rotate([0,0,0]) {
linear_extrude(height=4)
{
    difference()
    {
        union() {
            for (i = [0:5]) {
                rotate([0, 0, i * 60 +5]) {
                    polygon([[-3,0], [-.6,16.5], [.6,16.5], [3,0]]);
                }
            }
        };
        circle(r=11);
    };
}  

linear_extrude(height=8) {
    difference() {
        circle(r=12);
        circle(r=9.5);
    }
}

translate([0,0,4])
linear_extrude(height=4)
{
    difference()
    {
        union() {
            circle(r=5.8);
            for (i = [0:5]) {
                rotate([0, 0, i * 60]) {
                    polygon([[-1,0], [-1,11], [1,11], [1,0]]);
                }
            }            
        }
        circle(r=3.5);
    };
}
}

linear_extrude(height=11) {
    circle(r=2.8);
    translate([25,0,0])circle(r=2.8);
    translate([25,-15,0])circle(r=2.8);
    translate([0,-28,0])circle(r=2.8);
    translate([-30,-30,0])circle(r=2.8);
    translate([-10,-45,0])circle(r=2.8);
}



translate([0, -28, 0]) {
rotate([0,0,-2]) {
    linear_extrude(height=3)
    {
        difference()
        {
            rotate([0, 0, 225]) {
                polygon([[8,0], [2,18], [2, 27], [0,34], [-2,35], [-2, 18], [-8,0]]);
            }
            circle(r=9);
        }
    }
    
    linear_extrude(height=6)
    {
        difference()
        {
            union() {
                rotate([0, 0, -46]) {
                    polygon([[9,0], [0,23], [-3,24], [-6.5,23], [-8.5,21.5], [-8,20.5], [-3,20], [1,0]]);
                }
                rotate([0, 0, 60]) {
                    polygon([[0,0], [2.5, 18.5], [7, 20], [5.5, 21], [2.5,21.5], [-1,21], [-9,0]]);
                }
            };
            circle(r=9);
        }
        
    }

    linear_extrude(height=11) {
        circle(r=2.8);
    }
    linear_extrude(height=8) {
        difference() {
             circle(r=10);
             circle(r=8);
        }
    }
    
    translate([0, 0, 6])
    linear_extrude(height=2) {
        difference() {
            union(){
                circle(r=5);
                for (i = [0:5]) {
                    rotate([0, 0, i * 60])
                    translate([0, -6, 0]) scale([1.5,7,1]) square(size=1, center=true);
                }
            }
            circle(r=3.5);
        }
    }

    linear_extrude(height=5)
    mirror([1,0,0]) spring(3, 10, 1.8, 4);
}
}

module spring(rad_in, rad_out, spoke_thickness, num_pis)
{
    for (i=[1:num_pis]) {
        r_in = rad_in + (i-1) / num_pis * (rad_out - rad_in);
        r_out = rad_in + i / num_pis * (rad_out - rad_in);
        rotate([0,0,(i-1)*180]) semi_spring(r_in, r_out, spoke_thickness);
    }
}

module semi_spring(rad_in, rad_out, spoke_thickness)
{
    translate([(rad_out - rad_in)/2, 0, 0])
	intersection()
	{
		difference()
		{
			circle(r=(rad_in + rad_out)/2);
			circle(r=(rad_in + rad_out)/2-spoke_thickness);	
		}
        d = rad_in + rad_out;
        translate([-d,0,0]) square(2*d, 2*d);
	}
}

translate([0,0,8.8])
linear_extrude(height=2.2) {
    polygon([[-2.8,0], [2.8, 0], [2.8, -30], [-2.8, -30]]);
    polygon([[0,-2.8], [0,2.8], [25,2.8], [25,-2.8]]);
    polygon([[25, -15+2.8], [25, -15-2.8], [2.8, -30], [-2.8, -30]]);
    polygon([[25+2.8, -15], [25-2.8, -15], [-2.8, 0], [2.8, 0]]);
    polygon([[25+2.8, -15], [25-2.8, -15], [25-2.8, 0], [25+2.8, 0]]);
    polygon([[0, 2.8], [0, -2.8], [-30+2.8, -30], [-30-2.8, -30]]);
    polygon([[-30,-30-2.8], [-30,-30+2.8], [0,-28+2.8], [0,-28-2.8]]);
    polygon([[2.8, -30], [-2.8, -30], [-10-2.8, -45], [-10+2.8, -45]]);
    polygon([[-10, -45-2.8], [-10, -45+2.8], [-30, -30+2.8], [-30, -30-2.8]]);
}

linear_extrude(height=4) {
    difference() {
        union() {
    polygon([[25+2.8, -15], [25-2.8, -15], [25-2.8, 0], [25+2.8, 0]]);
    polygon([[25, -15+2.8], [25, -15-2.8], [bl, 5-2.8], [bl, 5+2.8]]);
    polygon([[25, +2.8], [25, -2.8], [bl, 10-2.8], [bl, 10+2.8]]);
    polygon([[bl, 5-2], [bl, 10], [bl-20, 10], [bl-20, 5-2]]);
        }
        translate([bl+5,7.5,0])
        circle(r=10);
    }
}

translate([0,0,3])
linear_extrude(height=3) {
    polygon([[-30-r, -30], [-30+r,-30], [-50+r,-100], [-50-r,-100]]);
    polygon([[-10-r, -45], [-10+r,-45], [-25+r,-100], [-25-r,-100]]);
    polygon([[-25,-100+r], [-25,-100-r], [-50,-100-r], [-50,-100+r]]);
    polygon([[-10,-45+r], [-10,-45-r], [-35,-45-r], [-35,-45+r]]);
}
linear_extrude(height=6) {
    translate([-35,-45,0]) circle(r=r);
    translate([-25,-100,0]) circle(r=r);
    translate([-50,-100,0]) circle(r=r);
}
}

half();
mirror([0,0,1]) half();