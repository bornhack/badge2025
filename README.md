# BornHack 2025 Circle Badge with LoRa

![BornHack 2025 Circle Badge with LoRa (prototype)](https://github.com/bornhack/badge2025/raw/main/IMAGES/DSC_1114.jpg "BornHack 2025 Circle Badge with LoRa (prototype)")

This badge focuses on LoRa and wireless communication in general, as there are also WiFi and Bluetooth Low Energy included in the ESP32-C3 module.

It's a relatively bare bone design, with pretty much just the minimum elements to run a Meshtastic node or similar device.

Even though there is an antenna on the PCB for LoRa (868MHz) it's unfortunately not connected as the [LoRa module](https://www.seeedstudio.com/Wio-SX1262-Wireless-Module-p-5981.html) is the variant that has a connector (uf.L/IPEX), so an [external antenna](https://www.molex.com/en-us/products/part-detail/2111400100) is provided in the kit, that is designed to match with the connector on the module. The external antenna has selfadhesive backing, but don't mount it to the PCB, as most of the PCB is covered with copper, which will heavily decrese the performance, so if you want to stick it to something, better use a plastic case or similar.

The badge comes preinstalled with [Meshtastic](https://meshtastic.org/) firmware, that you can hook up to and configure using the Mestastic app on your phone (Android or iOS). The two apps are slightly different, but does have more or less the same overall features.

If you want to use Meshtastic for a longer period, it's recommended to power the badge via USB-C (simple  5V, eg. power bank or power adapter).

In addition to the LoRa module, there are 5 RGB LEDs on the side, a qwiic/StemmaQT connector and a footprint for a SAO v1.69bis connector for expansions, mostly for alternative firmwares.

## Projects running on the badge

Feel free to submit a PR adding on to this list with your project that runs on the badge.

- [Initial Meshtastic firmware](https://github.com/badgeteam/bornhack2025-meshtastic) ([Flasher tool](https://github.com/badgeteam/bornhack2025-flasher))
- _project name and link to more info_


## Designed in KiCad v9

To open the project, you will need to install a recent release version or one of the nightly builds, KiCad v8 or earlier won't open this design. The [schematic as a PDF](https://github.com/bornhack/badge2025/raw/main/schematics.pdf) is included for reference.


## License

The hardware design of the `main` branch of this repository is released under the following license:

* the "Creative Commons Attribution-ShareAlike 4.0 International License"
  (CC BY-SA 4.0) full text of this license is included in the LICENSE file
  and a copy can also be found at
  [http://creativecommons.org/licenses/by-sa/4.0/](http://creativecommons.org/licenses/by-sa/4.0/)