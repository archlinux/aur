#!/usr/bin/python
# -*- coding: utf-8 -*-
# vim:set ts=2 sw=2 et:
# Alexander Rødseth <rodseth@gmail.com>
# BSD license
# 20102011

import os
import os.path
from sys import exit, argv
from time import localtime
from subprocess import getstatusoutput

ver = "Eclipse motivational splash screen setup v 1.1"
instmsg = "Installing Eclipse motivational splash image..."
req = "Must run as root"
progdir = "/usr/share/eclipse-motivational-splash"

def ls(path): #: list
  return os.listdir(os.path.expanduser(path))

def lsd(path): #: list
  return [e[1] for e in sorted([(os.path.getmtime(os.path.join(path, f)), os.path.join(path, f)) for f in ls(path)])]

def install_splash(newsplashfile, msg=instmsg):
  status, splashdata = getstatusoutput("pacman -Ql eclipse")
  splash = ""
  for line in splashdata.split("\n"):
    if line.endswith("splash.bmp"):
        splash = line
        break
  try:
    splashfile = splash.split()[1]
  except IndexError:
    print("Unable to find eclipse splash image (got %s)" % (splash))
    exit(1)
  esplashdir = os.path.dirname(splashfile)
  today = "-".join(map(str, localtime()[0:6]))
  backupfile = os.path.join(progdir, "splash-backup-%s.bmp" % (today))
  if os.path.exists(splashfile):
    if 0 != getstatusoutput("mv -f %s %s" % (splashfile, backupfile))[0]:
      print(ver + "\n" + req)
      exit(1)
    print(msg, end=" ")
    if 0 != getstatusoutput("cp %s %s" % (newsplashfile, splashfile))[0]:
      print()
      print("Unable to install splash image to %s/" % (esplashdir))
      exit(1)
  else:
    splashdir = os.path.dirname(splashfile)
    if 0 != getstatusoutput("mkdir -p %s" % (splashdir))[0]:
      print(ver + "\n" + req)
      exit(1)
    print(msg, end=" ")
    if 0 != getstatusoutput("cp %s %s" % (newsplashfile, splashfile))[0]:
      print()
      print("Unable to install splash image to %s/" % (esplashdir))
      exit(1)
  print("done")

def main():
  newsplashfile = os.path.join(progdir, "splash.bmp")  
  arguments = argv[1:]
  if arguments:
    if arguments[0] == "-r":
      status, splashdata = getstatusoutput("pacman -Ql eclipse")
      # if eclipse is removed, nothing to do
      if status != 0:
        print("done")
        exit(0)
      else:
        # if eclipse is here, move oldest splash backup as the new splash
        last = [f for f in lsd(progdir) if "backup" in f][:1]
        if last:
          lastfile = last[0]
          install_splash(lastfile, instmsg.replace("Installing", "Resetting"))
        else:
          # Directory probably doesn't exist, nothing to do
          print("done")
          exit(0)
  else:
    install_splash(newsplashfile)

if __name__ == "__main__":
  main()
