* The software is installed into `/opt/tingle/` -- with `/usr/bin/tingle` beeing a symlink to `/opt/tingle/main.py`.
* The input and output directories are at `/var/tingle/` -- they are world read- and writeable.
* The input files must be "deodexed" and:
  - can either be grabbed from a connected android device via `adb`, or
  - manually be placed into `/var/tingle/input/`; there must be (at least) `framework.jar` and `build.prop`.
