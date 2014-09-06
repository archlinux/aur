#!/bin/bash

#TODO: change /args to gnu ones in this wrapper, -h if will need -h$

for ARGV in $@ ; do
  if [[ $ARGV == *'-h'* ]]; then
    cat <<HELP
GpuTest 0.7.0 usage (AUR wrapper, no warranty nor support)
  -h --help   This message
  /fullscreen
  /gpumon_terminal # always passed by gui
  /width=XRES
  /height=YRES
  /test=DEMO
  /benchmark
  /print_score # was used together with benchmark
  /submit_gpudb
  /user_screen_name # name for submit?

Demos:
  fur some_desc and urls copy&paste
  tess_x8
  tess_x16
  tess_x32
  tess_x64
  gi
  pixmark_julia_fp32
  pixmark_julia_fp64
  pixmark_piano
  pixmark_volplosion
  plot3d
  triangle (Default)
HELP
    exit 0
  fi
done

cd /opt/gputest
exec ./GpuTest "$@"

