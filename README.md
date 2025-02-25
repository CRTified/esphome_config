# Introduction

This repo contains my [esphome.io](https://esphome.io) config files.

# Organization

| Path       | Content                                                                        |
|------------|--------------------------------------------------------------------------------|
| `assets/`  | Pictures, helper scripts and other misc content not required to run esphome    |
| `common/`  | Shared configurations, i.e., base config and fundamental device configurations |
| `devices/` | Configuration for specific devices`                                            |

For the common configuration aspects, this set of configurations relies on [esphome packages](https://esphome.io/components/packages.html). This allows merging the YAML files key-by-key.

# Configuration files

## Base configuration

### [`common/base.yaml`](./common/base.yaml)

This file contains the fundamental configuration for all of my
esphome-powered devices.

### `./secrets.yaml`

Ignored in `.gitignore`.

Contains secrets for inclusion in other configs.
See <https://esphome.io/guides/faq#tips-for-using-esphome>.


## Fundamental Device Configs

### [`common/device.esp32-wrover-dev-cam-ov2640.yaml`](./common/device.esp32-wrover-dev-cam-ov2640.yaml)

Bought at <https://www.amazon.de/dp/B0CP7S6D9Z/>

This is a ESP32-CAM based on the ESP32-WROVER-DEV.

### [`common/device.esp_ir_tr.yaml`](./common/device.esp_ir_tr.yaml)
Bought at <https://www.amazon.de/dp/B0DFCHK1GT/>

A simple IR Rx/Tx module. Requires 5V via pin headers.

### [`common/device.h801.yaml`](./common/device.h801.yaml)

An integrated LED driver, able to drive 5 channels (RGB+CCT).

### [`common/device.lolin_s2_mini.yaml`](./common/device.lolin_s2_mini.yaml)

Simple dev board for prototyping.
**No support for Bluetooth**.

## Devices

### [`devices/fledermaus.yaml`](./devices/fledermaus.yaml)

![Picture of an LED decoration. The LEDs trace the outline of a bat and have numbers next to them from counting the index of the LEDs along the outline](./assets/fledermaus.png)

LED decoration which I modded the hell out of it. Replaced the
monocolor LED strip with a high-density SK6812 RGB LED-strip.

Uses a Lolin S2 mini as driver, which does not support bluetooth.

### [`devices/trotec_145e_remote.yaml`](./devices/trotec_145e_remote.yaml)

Remote-enabled copy of the IR remote of a Trotec 140E/145E air purifier.

### [`devices/solder_fan.yaml`](./devices/solder_fan.yaml)

Device: Nous A8T.

ESP32-C3 powered smart plug that connects to my pinecil over Bluetooth and reports the status. It also triggers the relay whenever the iron reports that it is in "Soldering"-mode, starting the fume extractor.
