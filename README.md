# Introduction

This repo contains my [esphome.io](https://esphome.io) config files.


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

### [`fledermaus.yaml`](./fledermaus.yaml)

### [`trotec_145e_remote.yaml`](./trotec_145e_remote.yaml)

### [`solder_fan.yaml`](./solder_fan.yaml)

Nous A8T. ESP32-C3 powered smart plug that connects to my pinecil over Bluetooth and reports the status. It also triggers the relay whenever the iron reports that it is in "Soldering"-mode, starting the fume extractor.
