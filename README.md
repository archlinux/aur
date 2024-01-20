# Prayer Times

## Overview

`prayer-times` is a program that provides Islamic prayer time notifications based on your geographical location. It calculates prayer times for Fajr, Dhuhr, Asr, Maghrib, and Isha using specified calculation methods and adjustments.

It uses accurate calculation of prayer times based on geographical coordinates based on the algorithm provided by [praytimes.org](http://praytimes.org/).

## Usage

```man
Usage: prayer-time [OPTIONS] --latitude <LATITUDE> --longitude <LONGITUDE>

Options:
  -l, --latitude <LATITUDE>        Latitude. Defaults to the current location
  -L, --longitude <LONGITUDE>      Longitude. Defaults to the current location
  -m, --method <METHOD>            Calculation Method to use [default: MuslimWorldLeague]
  -M, --madhab <MADHAB>            Madhab to use [default: Shafi]
      --fajr-mod <FAJR_MOD>        Minutes to add or remove to the Fajr time [default: 0]
      --dohr-mod <DOHR_MOD>        Minutes to add or remove to the Dohr time [default: 0]
      --asr-mod <ASR_MOD>          Minutes to add or remove to the Asr time [default: 0]
      --maghrib-mod <MAGHRIB_MOD>  Minutes to add or remove to the Maghrib time [default: 3]
      --isha-mod <ISHA_MOD>        Minutes to add or remove to the Isha time [default: 0]
      --notify-before              Show notification 10 minutes before prayer time
  -h, --help                       Print help
  -V, --version                    Print versio
```

## Installation

Clone the repository and build the executable. You should have `cargo` installed:

```sh
git clone https://github.com/Yasso9/prayer-times
cd prayer-times
cargo build --release
```

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use and contribute to this open-source project.
