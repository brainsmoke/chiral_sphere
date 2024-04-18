EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:RJ45_Shielded J1
U 1 1 6615B28B
P 3450 1650
F 0 "J1" H 3507 2317 50  0000 C CNN
F 1 "RJ45_Shielded" H 3507 2226 50  0000 C CNN
F 2 "footprints:HC-RJ45-055-7" V 3450 1675 50  0001 C CNN
F 3 "~" V 3450 1675 50  0001 C CNN
	1    3450 1650
	-1   0    0    1   
$EndComp
$Comp
L power_connector:xt30 U1
U 1 1 6615DB0E
P 1800 3000
F 0 "U1" H 1742 2635 50  0000 C CNN
F 1 "xt30" H 1742 2726 50  0000 C CNN
F 2 "footprints:xt30-PW-F_banana" H 1800 3000 50  0001 C CNN
F 3 "" H 1800 3000 50  0001 C CNN
	1    1800 3000
	-1   0    0    1   
$EndComp
$Comp
L dcdc:mini560 U2
U 1 1 66206E94
P 3200 3400
F 0 "U2" H 3200 3965 50  0000 C CNN
F 1 "mini560" H 3200 3874 50  0000 C CNN
F 2 "footprints:mini560" H 3200 3400 50  0001 C CNN
F 3 "" H 3200 3400 50  0001 C CNN
	1    3200 3400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J4
U 1 1 6620A352
P 4400 3100
F 0 "J4" H 4508 3381 50  0000 C CNN
F 1 "Conn_01x03_Male" H 4508 3290 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 4400 3100 50  0001 C CNN
F 3 "~" H 4400 3100 50  0001 C CNN
	1    4400 3100
	-1   0    0    1   
$EndComp
Wire Wire Line
	2100 3100 2200 3100
$Comp
L power:GND #PWR0102
U 1 1 6620D657
P 2300 3800
F 0 "#PWR0102" H 2300 3550 50  0001 C CNN
F 1 "GND" H 2305 3627 50  0000 C CNN
F 2 "" H 2300 3800 50  0001 C CNN
F 3 "" H 2300 3800 50  0001 C CNN
	1    2300 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 3800 2300 3650
Wire Wire Line
	2300 2900 2100 2900
Wire Wire Line
	2650 3650 2600 3650
Connection ~ 2300 3650
Connection ~ 2200 3100
Wire Wire Line
	2200 3100 2600 3100
$Comp
L power:GND #PWR0103
U 1 1 6621018A
P 3850 3800
F 0 "#PWR0103" H 3850 3550 50  0001 C CNN
F 1 "GND" H 3855 3627 50  0000 C CNN
F 2 "" H 3850 3800 50  0001 C CNN
F 3 "" H 3850 3800 50  0001 C CNN
	1    3850 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 3800 3850 3650
Wire Wire Line
	3750 3650 3850 3650
Wire Wire Line
	3850 3650 3850 3200
Wire Wire Line
	3850 3200 4200 3200
Connection ~ 3850 3650
Wire Wire Line
	4200 3100 3800 3100
Wire Wire Line
	4200 3000 3900 3000
$Comp
L power_connector:xt30 U3
U 1 1 6621CDAB
P 1800 3650
F 0 "U3" H 1742 3285 50  0000 C CNN
F 1 "xt30" H 1742 3376 50  0000 C CNN
F 2 "footprints:xt30-PW-M_banana" H 1800 3650 50  0001 C CNN
F 3 "" H 1800 3650 50  0001 C CNN
	1    1800 3650
	-1   0    0    1   
$EndComp
Wire Wire Line
	2300 2900 2300 3550
Wire Wire Line
	2200 3750 2100 3750
Wire Wire Line
	2200 3100 2200 3750
Wire Wire Line
	2100 3550 2300 3550
Connection ~ 2300 3550
Wire Wire Line
	2300 3550 2300 3650
$Comp
L Connector:RJ45_Shielded J3
U 1 1 6622205C
P 1800 1750
F 0 "J3" H 1857 2417 50  0000 C CNN
F 1 "RJ45_Shielded" H 1857 2326 50  0000 C CNN
F 2 "footprints:HC-RJ45-055-7" V 1800 1775 50  0001 C CNN
F 3 "~" V 1800 1775 50  0001 C CNN
	1    1800 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 1550 2800 1550
Wire Wire Line
	3050 1750 2800 1750
Wire Wire Line
	3050 1950 2800 1950
Wire Wire Line
	3450 1150 3450 800 
Wire Wire Line
	3450 800  1300 800 
Wire Wire Line
	1300 800  1300 2250
Wire Wire Line
	1300 2250 1800 2250
Text GLabel 2550 2850 0    50   Input ~ 0
12V
Text GLabel 3750 2850 0    50   Input ~ 0
5V
Wire Wire Line
	3750 2850 3800 2850
Wire Wire Line
	3800 2850 3800 3100
Connection ~ 3800 3100
Wire Wire Line
	3800 3100 3750 3100
Wire Wire Line
	2600 2850 2600 3100
Connection ~ 2600 3100
Wire Wire Line
	2600 3100 2650 3100
Wire Wire Line
	2550 2850 2600 2850
Text GLabel 2550 3500 0    50   Input ~ 0
GND
Wire Wire Line
	2550 3500 2600 3500
Wire Wire Line
	2600 3500 2600 3650
Connection ~ 2600 3650
Wire Wire Line
	2600 3650 2300 3650
Wire Wire Line
	3900 3000 3900 1100
Wire Wire Line
	2500 1100 2450 1100
Wire Wire Line
	3900 1100 2500 1100
Connection ~ 2500 1100
Wire Wire Line
	2500 950  2550 950 
Wire Wire Line
	2450 950  2500 950 
Connection ~ 2500 950 
Wire Wire Line
	2500 950  2500 1100
Wire Wire Line
	2950 950  3000 950 
Wire Wire Line
	3000 1350 3050 1350
Connection ~ 3000 1350
Wire Wire Line
	3000 950  3000 1350
$Comp
L Jumper:Jumper_2_Open JP1
U 1 1 66252D0F
P 2750 950
F 0 "JP1" H 2750 1185 50  0000 C CNN
F 1 "Jumper_2_Open" H 2750 1094 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_TrianglePad1.0x1.5mm" H 2750 950 50  0001 C CNN
F 3 "~" H 2750 950 50  0001 C CNN
	1    2750 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 1100 2450 1250
$Comp
L Connector:Conn_01x09_Male J2
U 1 1 66207DB1
P 2600 1650
F 0 "J2" H 2708 2231 50  0000 C CNN
F 1 "Conn_01x09_Male" H 2708 2140 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x09_P2.54mm_Vertical" H 2600 1650 50  0001 C CNN
F 3 "~" H 2600 1650 50  0001 C CNN
	1    2600 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 2050 2400 2050
Wire Wire Line
	2400 2250 2400 2050
$Comp
L power:GND #PWR0101
U 1 1 6620BF59
P 2950 2400
F 0 "#PWR0101" H 2950 2150 50  0001 C CNN
F 1 "GND" H 2955 2227 50  0000 C CNN
F 2 "" H 2950 2400 50  0001 C CNN
F 3 "" H 2950 2400 50  0001 C CNN
	1    2950 2400
	1    0    0    -1  
$EndComp
Text GLabel 2450 950  0    50   Input ~ 0
LED_DATA
Wire Wire Line
	2800 1350 3000 1350
Wire Wire Line
	2800 1450 3050 1450
Wire Wire Line
	2800 1650 3050 1650
Wire Wire Line
	2800 1850 3050 1850
Wire Wire Line
	2800 2050 3050 2050
Wire Wire Line
	2800 1350 2250 1350
Connection ~ 2800 1350
Wire Wire Line
	2800 1450 2200 1450
Connection ~ 2800 1450
Wire Wire Line
	2200 1550 2800 1550
Connection ~ 2800 1550
Wire Wire Line
	2800 1650 2200 1650
Connection ~ 2800 1650
Wire Wire Line
	2200 1750 2800 1750
Connection ~ 2800 1750
Wire Wire Line
	2800 1850 2200 1850
Connection ~ 2800 1850
Wire Wire Line
	2200 1950 2800 1950
Connection ~ 2800 1950
Wire Wire Line
	2800 2050 2400 2050
Connection ~ 2800 2050
Connection ~ 2400 2050
Wire Wire Line
	2450 1250 2800 1250
$Comp
L Jumper:Jumper_2_Bridged JP2
U 1 1 66217DA6
P 2700 2250
F 0 "JP2" H 2700 2445 50  0000 C CNN
F 1 "Jumper_2_Bridged" H 2700 2354 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 2700 2250 50  0001 C CNN
F 3 "~" H 2700 2250 50  0001 C CNN
	1    2700 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 2400 2950 2250
Wire Wire Line
	2950 2250 2900 2250
Wire Wire Line
	2500 2250 2400 2250
$Comp
L power:GND #PWR0104
U 1 1 6621EB02
P 2800 2550
F 0 "#PWR0104" H 2800 2300 50  0001 C CNN
F 1 "GND" H 2805 2377 50  0000 C CNN
F 2 "" H 2800 2550 50  0001 C CNN
F 3 "" H 2800 2550 50  0001 C CNN
	1    2800 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 2550 2800 2400
Wire Wire Line
	2800 2400 2750 2400
Wire Wire Line
	2350 2400 2250 2400
Wire Wire Line
	2250 2400 2250 1350
Connection ~ 2250 1350
Wire Wire Line
	2250 1350 2200 1350
$Comp
L Jumper:Jumper_2_Open JP3
U 1 1 66222B50
P 2550 2400
F 0 "JP3" H 2550 2635 50  0000 C CNN
F 1 "Jumper_2_Open" H 2550 2544 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 2550 2400 50  0001 C CNN
F 3 "~" H 2550 2400 50  0001 C CNN
	1    2550 2400
	1    0    0    -1  
$EndComp
$EndSCHEMATC
