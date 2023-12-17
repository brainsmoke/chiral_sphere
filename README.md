# Chiral Sphere

LED lamp based on a chiral spherical tiling consisting of 20 triangles and
12 Pentagons where the edge-length ratio triangle:pentagon is 2:1.

<img src="img/done.jpg" width="512">

# Materials

* 30x LED strip with 17 WS2812 LEDs, 10mm
* +/- 11 meters flexible diffuser, 12mm wide
* custom joint PCBs
* thin wire (for connecting the data lines)
* 2x ~30cm thick wire (to handle high currents near the power connector)
* 3mm plywood, 4x 400x600mm
* white paint
* wood glue

# Maths

Formula for the relation between corner arc and edge-length for regular N-gons on
the unit sphere: https://github.com/brainsmoke/geometry/blob/main/spherical/ngonmath.png

Calculation of the corner arc for this spherical tiling:
https://github.com/brainsmoke/geometry/blob/main/spherical/2tri1penta.scad#L8-L34

# Cutting

[Laser cut shapes](cut/led.svg) (with some spares, no kerf width compensation done)

# Software

https://github.com/brainsmoke/esp32leddriver

# More pictures

<img src="img/glued.jpg" width="512">

<img src="img/stinkykit.jpg" width="512">

<img src="img/glueup.jpg" width="512">

<img src="img/halfway.jpg" width="512">


<img src="img/joint_panel.jpg" width="512">

<img src="img/closeup.jpg" width="512">

<img src="img/wiringdone.jpg" width="512">

Add extra capacity to the strip which needs to handle the most Amps.
<img src="img/extra_copper.jpg" width="512">

<img src="img/driver.jpg" width="512">

