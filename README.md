# toobamp-bin

*This document is written by the package maintainer. It is NOT upstream
ToobAmp documentation.*

## What this is

A binary repack of upstream's amd64 `.deb` release of
[ToobAmp](https://github.com/rerdavies/ToobAmp) — a bundle of LV2 guitar
effects plugins (amp models, cab sims, reverb, delay, modulation, tuner,
looper, ...) by Robin Davies, primarily intended for PiPedal but usable
in any LV2 host.

## What the package does

Installing copies files and prints nothing. It:

- installs the plugin bundle to `/usr/lib/lv2/ToobAmp.lv2/`
- installs the license texts to `/usr/share/licenses/toobamp-bin/`

It does **not** start services, create users, modify configuration, or
run any upstream installer. The deb ships no maintainer scripts, so
there is nothing to run.

## Usage

The plugins appear in any LV2 host: Ardour, Carla, jalv, Reaper,
PiPedal, and others. Load the host, then add e.g. the Toob amp models
(`ToobTone`, `ToobML`, `CabSim`) or the effect pedals
(`ToobDelay`, `ToobChorus`, `ToobReverb`, ...).

## Licenses

- Main code: MIT (© 2020–2026 Robin E. R. Davies)
- ToobML: MPL-2.0
- Impulse responses: CC-BY-4.0 (Adventure Kid) and the OpenAir project
  licenses — license texts ship inside the bundle under
  `impulseFiles/`
- Third-party components (Eigen, xsimd, ...): Apache-2.0 / BSD-3-Clause,
  documented in the shipped `LICENSE` (upstream's Debian copyright file)
