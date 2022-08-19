#!/bin/bash
makepkg
makepkg --printsrcinfo > .SRCINFO
rm -rfv python-bmi160-i2c* pkg src
