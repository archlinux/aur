# openbox-patched

This repo contains a `PKGBUILD` and various patches for Openbox `3.6.2`. The purpose of this repo is to track issues and fix quirks with the Rounded Corners patch.


![scrot](http://i.imgur.com/ThihqTS.png)


## Installation

Install `openbox-patched` from the AUR.


## Patches

This package uses the following patches.


### Rounded Corners

This patch adds support for rounded corners to Openbox.

> Source: https://forums.bunsenlabs.org/viewtopic.php?pid=46711#p46711


**Enabling rounded corners:**

To enable Rounded Corners add this line to the '<theme>' section of your Openbox config.

    '<cornerRadius>8</cornerRadius>'

The patch also takes an argument for menu corners.

    '<cornerRadius menu="yes">8</cornerRadius>'


**Issues/Quirks**

- [x] ~~Docked windows have rounded corners.~~
- [x] ~~Fullscreen windows have rounded corners.~~


### Fix out of bounds

This patch fixes a crash when only a single window button is enabled.

> Source: https://github.com/danakj/openbox/pull/26
