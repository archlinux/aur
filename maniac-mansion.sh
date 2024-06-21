#!/bin/sh

# This script is licensed under the GNU General Public License version 3 (or later).
# The license text should be installed together with this software; otherwise it can be optained at https://www.gnu.org/licenses/gpl-3.0.en.html.

_maniacdir='/usr/lib/maniac-mansion'

printf '%s\n' \
  "Launching Maniac Mansion with ScummVM ..." \
  ""  \
  "For further optional options (e.g. graphics scaling an audio), see 'man scummvm'/ 'scummvm --help'." \
  "You can also consult this script, '$0', for hints how to launch Maniac Mansion manually with ScummVM". \
  "" \
  "For custom settings, you can add Maniac Mansion to your local ScummVM configuration by just launching 'scummvm' (without options) and then click 'Add Game...' and point to '${_maniacdir}'. Then you can launch Maniac Mansion with your customisations from your ScummVM GUI instead of using this script '$0'." \
  "" \
  "Default in game controls (can be changed):" \
  "  * Mouse:          Move pointer." \
  "  * Mouse click:    Movement/ Interact." \
  "  * Ctrl + 0-9:     Loads saved game" \
  "  * Alt + 0-9:      Saves game" \
  "  * Crtl + Alt + d: Starts the debugger" \
  "  * Crtl + f:       Toggles fast mode on/off" \
  "  * Crtl + g:       Toggles really REALLY fast mode on/off" \
  "  * Crtl + t:       Switches between 'Speech only', 'Speech and Subtitles' and 'Subtitles only'" \
  "  * Tilde ~:        Shows/hides the debugging console" \
  "  * [ and ]:        Changes music volume down/up" \
  "  * - and +:        Changes text speed slower/faster" \
  "  * F5:             Displays the save/load window" \
  "  * Alt + F5:       Displays the original save/load window, if the game has one." \
  "  * i:              Displays IQ points (Indiana Jones and the Last Crusade, and Indiana Jones and the Fate of Atlantis)" \
  "  * Space:          Pauses" \
  "  * Period .:       Skips current line of text in some games" \
  "  * Enter:          Simulates left mouse button click" \
  "  * Tab:            Simulates right mouse button click" \
  "" \
  "Enjoy Maniac Mansion!" \
  ""

scummvm --gui-theme=scummmodern --gfx-mode=opengl --renderer=opengl_shaders --scaler=hq --stretch-mode=fit --path="${_maniacdir}" "$@" maniac
