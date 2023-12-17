# Chiral Sphere

LED lamp based on a chiral spherical tiling consisting of 20 triangles and
12 Pentagons where the edge-length ratio triangle:pentagon is 2:1.

<img src="img/done.jpg" width="512">

# Materials

* 30x LED strip with 17 WS2812 LEDs, 10mm
* +/- 11 meters flexible diffuser, 12mm wide
* [custom joint PCBs [kicad]](yjoint) [[svg]](yjoint/penta_joint.svg)
* [LED driver board](https://github.com/brainsmoke/esp32leddriver/tree/master/pcb/edgedriver_slim_v1)
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

[Laser cut shapes](cut/led.svg) (with some spares, apply appropriate kerf width compensation done using cutting software)

# Wiring

All strips are positioned such that data-in is above data-out, with one pentagon chosen
as top.  The strips are connected as five point-symmetrical led strips with 102 LEDs each
according to [this OpenSCAD model](doc/wiring.scad).

<img src="doc/wiring.png" width="512">

# LED Driver

[PCB](https://github.com/brainsmoke/esp32leddriver/tree/master/pcb/edgedriver_slim_v1)

# Software

* [Driver software repo](https://github.com/brainsmoke/esp32leddriver)
* [STM32 Firmware: strip5.bin](https://github.com/brainsmoke/esp32leddriver/tree/master/firmware/stm32/m02812/src)
* [LED positions](https://github.com/brainsmoke/esp32leddriver/blob/master/firmware/esp32/fs/models/chiral_tiling/leds.json)

[conf/board.json](https://github.com/brainsmoke/esp32leddriver/blob/master/firmware/esp32/fs/conf/board.json)
```
{
    "uart":
    {
        "baudrate": 2000000,
        "tx": 13,
        "rx": 35
    }
}
```

[conf/model.json](https://github.com/brainsmoke/esp32leddriver/blob/master/firmware/esp32/fs/conf/board.json)
```
{
    "model": "/models/chiral_tiling",
}
```

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

