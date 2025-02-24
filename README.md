# Introduction

This repo contains my [esphome.io](https://esphome.io) config files.

# Organization

File organization is based on the approach presented in <https://simplyexplained.com/blog/how-i-structure-my-esphome-config-files/>.

# Configuration files

## Base configuration

### [`.base.yaml`](./.base.yaml)

This file contains the fundamental configuration for all of my
esphome-powered devices.

### `secrets.yaml`

Ignored in `.gitignore`.

Contains secrets for inclusion in other configs.
See <https://esphome.io/guides/faq#tips-for-using-esphome>.


## Fundamental Device Configs

### [`.base.esp32-wrover-dev-cam-ov2640.yaml`](./.base.esp32-wrover-dev-cam-ov2640.yaml)

Bought at <https://www.amazon.de/dp/B0CP7S6D9Z/>

This is a ESP32-CAM based on the ESP32-WROVER-DEV.

### [`.base.esp_ir_tr.yaml`](./.base.esp_ir_tr.yaml)
Bought at <https://www.amazon.de/dp/B0DFCHK1GT/>

A simple IR Rx/Tx module. Requires 5V via pin headers.

### [`.base.h801.yaml`](./.base.h801.yaml)

An integrated LED driver, able to drive 5 channels (RGB+CCT).

### [`.base.lolin_s2_mini.yaml`](./.base.lolin_s2_mini.yaml)

Simple dev board for prototyping.
**No support for Bluetooth**.

## Devices

### [`fledermaus.yaml`](./fledermaus.yaml)

### [`trotec_145e_remote.yaml`](./trotec_145e_remote.yaml)
