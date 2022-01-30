#!/bin/bash

set -e
set -u

_atari='c/games/atari'
#_atari='c/ATARI'

shopt -s nullglob
sticks=(/dev/input/js*); sticks="${#sticks[@]}"
case "${sticks}" in
0) echo "Please connect a stick"; false ;;
1|2|3|4);;
*) sticks=2;;
esac
echo "Detected ${sticks} joysticks"

_fn_ataripp() {
  echo 'Launching atari++'
  #_stick='DigitalJoystick'
  #_stick='SDLDigital'
  #_stick='AnalogJoystick'
  _opts=(
    --config ~/'.atari++.cfg'
    -Machine '800'
    -AcceptLicence 'On'
    -GTIAVideoMode 'NTSC'
    -ChipGeneration 'GTIA'
    -OsAPath ~/"${_atari}/AtariBIOS/OS Rev A (19xx)(Atari)(PAL)(400-800).rom"
    -OsBPath ~/"${_atari}/AtariBIOS/OS Rev B (19xx)(Atari)(NTSC)(400-800).rom"
    #-Os1200Path
    -OsXLPath ~/"${_atari}/AtariBIOS/atarixl.rom"
    -Os5200Path ~/"${_atari}/AtariBIOS/5200 boot ROM (19xx)(Atari)(5200 Game System).rom"
    -OsType 'OsB'
    -VideoMode 'NTSC'
    -EnablePrinter 'off'
    -Image.1 ~/"${_atari}/romsdave/MULE.ATR"
    #-PixelWidth '4' -PixelHeight '4' # 1920x1200
    -PixelWidth '3' -PixelHeight '3' # Smaller for slow ATI card
    #-PixelWidth '2' -PixelHeight '2' # 1366x768
    -xvideorendering 'on'
  )

  while [ "${sticks}" -gt 0 ]; do
    sticks=$((sticks-1))
    _opts+=("-Joystick.${sticks}.Port" "SDLAnalog.${sticks}" "-SDL_First_Button.${sticks}" '2' "-SDL_Second_Button.${sticks}" '1')
    # No dpad or stick control on Super JoyBox 5
    #_opts+=("-Joystick.${sticks}.Port" "AnalogJoystick.${sticks}" "-First_Button.${sticks}" '2' "-Second_Button.${sticks}" '1')
  done
  unset sticks

  echo '
http://www.xl-project.com/man/manual/atari++.html

PS2 Analog Off
PS2 Fire button circle

F1 Menu, or mouse at top of screen
F2 Option
F3 Select
F4 Start
F6 Reset
F7 Cold Starts
F10 Exit Emulator
F11 Pause
(No turbo key)
'
  atari++ "${_opts[@]}"
}

_fn_atari800() {
if ! :; then
  echo 'Launching atari800'
  if [ ! -s ~/'.atari800.cfg' ]; then
    atari800 # Quit this immediately
  fi

  extras=('ATARI_FILES_DIR=' 'SAVED_FILES_DIR=')
  for extra in "${extras[@]}"; do
    if ! grep -qe "^${extra}"  ~/'.atari800.cfg'; then
      echo "${extra}" >>  ~/'.atari800.cfg'
    fi
  done
  unset extras extra

  # No command line for disk settings
fi

  # A 3.1 config used in 4.0 will result in washed out colors, change
  # COLOURS_NTSC_GAMMA=2.35 <- 0.3                                                                   │
  # COLOURS_PAL_GAMMA=2.35 <- 0.3
  # Or better yet, just delete ~/.atari800.cfg because there are other settings changes

  # Limited to 2 sticks, now supports 4 sticks
  mul=$(( (1500-65)/30*10 ))
  _opts=(
    -atari
    -autosave-config
    -nobasic
    -ntsc
    # -run ~/"${_atari}/romsdave/mule.atr'
    -osa_rom ~/"${_atari}/AtariBIOS/OS Rev A (19xx)(Atari)(PAL)(400-800).rom"
    -osb_rom ~/"${_atari}/AtariBIOS/OS Rev B (19xx)(Atari)(NTSC)(400-800).rom"
    -xlxe_rom ~/"${_atari}/AtariBIOS/atarixl.rom"
    -5200_rom ~/"${_atari}/AtariBIOS/5200 boot ROM (19xx)(Atari)(5200 Game System).rom"
    -800-rev b-ntsc
    -mouse off
    #-win-width $((w=1920)) # 1920x1200
    -win-width $((mul*3)) # 1920x1200
    #-win-width $((w=1290)) # 1366x768
    -win-height $((mul*2))
    -fs-width '640'
    -fs-height '480'
    -windowed
    -stretch 'integral'
    -image-aspect 'square-pixels'
    -no-rotate90
    -no-80column
    -scanlines '0'
    # -video-accel # This makes F12 turbo go way too fast
    -sound
    -showspeed
    #-multijoy # breaks all joysticks, doesn't add 4 sticks
    # new features as of 2019-12-27
    -kbdjoy0
    -kbdjoy1
    -atari_files "${HOME}/${_atari}/romsdave"
    -saved_files "${HOME}/${_atari}"
  )

  analog='Off'
  players='2'
  ver="$(atari800 --version)" || :
  ver="${ver##* }"
  if [ "$(vercmp "${ver}" '4.0.0')" -ge 0 ]; then
    analog='On'
    players='4'
    _opts+=(
      -joy0hat
      -joy1hat
      -joy2hat
      -joy3hat
    )
  fi
if ! :; then
  # No command line switches for some settings
  sed -e 's:^\(SDL_JOY_0_ENABLED\)=.*$:\1=1:g' \
      -e 's:^\(ATARI_FILES_DIR\)=.*$:'"\1=${HOME}/${_atari}/romsdave:g" \
      -e 's:^\(SAVED_FILES_DIR\)=.*$:'"\1=${HOME}/${_atari}:g" \
    -i ~/'.atari800.cfg'
fi

  echo "
https://github.com/dmlloyd/atari800/blob/master/DOC/USAGE

PS2 Analog ${analog}
PS2 Fire button all buttons
Supports ${players} players"'

F1 Emulator Menu
F2 Option
F3 Select
F4 Start
F5 Reset key ("warm reset")
Shift+F5 Reboot ("cold reset")
F9 Exit emulator
F12 Turbo mode (toggle)
Alt+R Run Atari program
Alt+L Load state file
Alt+S Save state file
'
  atari800 "${_opts[@]}"
}

# _fn_ataripp
_fn_atari800
