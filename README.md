# Prayer Times

## Overview

`prayer-times` is a program that provides Islamic prayer times notifications based on your geographical location. It calculates prayer times for Fajr, Dhuhr, Asr, Maghrib, and Isha using specified calculation methods and adjustments.

It uses accurate calculation of prayer times based on geographical coordinates based on the algorithm provided by [praytimes.org](http://praytimes.org/).

## Installation

### Arch linux

`prayer-times` is available in the [AUR](https://aur.archlinux.org/). You can install it with yay or paru depending on what you have.

```sh
yay -S prayer-times
```

or

```sh
paru -S prayer-times
```

### Manual

Clone the repository and build the executable. You should have `cargo` installed:

```sh
git clone https://github.com/Yasso9/prayer-times
cd prayer-times
cargo build --release
```

## Usage

```man
Usage: prayer-times [OPTIONS] [COMMAND]

Commands:
  deamon          Start the process that will send notifications on prayers time [default]
  current         Get the current prayer
  next            Get the next prayer
  list-prayers    List all the prayers of the current day
  list-methods    List all methods available for the calculation of the prayer times
  list-madhab     List all madhab available for the calculation of the prayer times
  dry-run         Show the next prayer in a notification to test if everything works
  config          Get the path of the toml config file
  generate-shell  Generate shell completions and man pages
  help            Print this message or the help of the given subcommand(s)

Options:
  -l, --latitude <LATITUDE>            Latitude. Defaults to the current location
  -L, --longitude <LONGITUDE>          Longitude. Defaults to the current location
  -m, --method <METHOD>                Calculation Method to use
  -M, --madhab <MADHAB>                Madhab to use
      --fajr-mod <FAJR_MOD>            Minutes to add or remove to the Fajr time
      --dohr-mod <DOHR_MOD>            Minutes to add or remove to the Dohr time
      --asr-mod <ASR_MOD>              Minutes to add or remove to the Asr time
      --maghrib-mod <MAGHRIB_MOD>      Minutes to add or remove to the Maghrib time
      --isha-mod <ISHA_MOD>            Minutes to add or remove to the Isha time
      --notify-before <NOTIFY_BEFORE>  Show notification 10 minutes before prayer time [default: false] [possible values: true, false]
      --icon <ICON>                    Custom icon path for notifications
      --urgency <URGENCY>              Notification urgency
  -h, --help                           Print help
  -V, --version                        Print version
```

You can also configurate the program from a config file located in `$XDG_CONFIG_HOME/prayer-times/config.toml`. Here is the default config :

```toml
[prayer]
method = "MuslimWorldLeague"
madhab = "Shafi"
fajr_mod = 0
dohr_mod = 0
asr_mod = 0
maghrib_mod = 0
isha_mod = 0

[notification]
notify_before = false
urgency = "Critical"
interval = 20
```

If you specify cli arguments, it will always take precedence on what you have on your config. If you don't specify any latitude and longitude it will be infered from your IP address. Location from an IP address is not always totally accurate so I advise you greatly to specify your own latitude and longitude if you want to have the most accurate prayer time.

## Examples

`prayer-times next`
```sh
Adhan Dhuhr in 01:13
```

`prayer-times list-prayers`
```sh
Prayer times:
Adhan Fajr at 07:32:32
Adhan Dhuhr at 13:55:24
Adhan Asr at 17:29:43
Adhan Maghrib at 20:23:24
Adhan Isha at 22:08:05
```

`prayer-times list-methods`
```sh
MuslimWorldLeague : [ fajr angle: 18, isha angle: 17 ]
NorthAmerica : [ fajr angle: 15, isha angle: 15 ]
Egyptian : [ fajr angle: 19.5, isha angle: 17.5 ]
UmmAlQura : [ fajr angle: 18.5, isha angle: 18.5 ]
Karachi : [ fajr angle: 18, isha angle: 18 ]
Tehran : [ fajr angle: 17.7, isha angle: 14 ]
Jafari : [ fajr angle: 16, isha angle: 14 ]
FranceUOIF : [ fajr angle: 12, isha angle: 12 ]
FranceGMP : [ fajr angle: 18, isha angle: 18 ]
```

`prayer-times list-madhab`
```sh
Madhab:
Shafi
Hanafi
```


## License

This project is licensed under the [MIT License](LICENSE). Feel free to use and contribute to this open-source project.
