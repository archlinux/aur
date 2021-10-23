# Background Remover

## The Need

It's been good long while since Microsoft first released a Teams version for Linux and yet, one of Teams' coolest features doesn't exist in said Linux version: removable backgrounds. As someone who uses Linux for their daily driver, this annoys me.

Well, I'm an engineer, so of course, I found a solution.

Using OpenCV and a v4l2loopback device (basically a virtual webcam you can write data to), I threw together a Python application that takes your normal webcam input, removes and replaces the background, and outputs that to the created video device. Problem solved :)

## How to Use

1. Setup
   - First time you set up you need to do the following
   - Create the proper virtual environment with `./scripts/setup-env.sh`
   - Patch the v4l2 library `./scripts/patch-v4l2-py-mod.sh`

2. Run
   - After setting up, you can run the application
   - Run with `sudo ./bgrm.sh <options>` (use `--help` to see all options)
   - Example: `sudo ./bgrm.sh -b ~/Pictures/Wallpapers/ni-skyline-wallpaper.png -w 320 -H 240 -s 2.0`

Note, this will work anywhere WebCams are used.

# Dependencies

 - python >= 3.9
 - pip
 - v4l2loopback-dkms
