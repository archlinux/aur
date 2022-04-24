#!/bin/bash

# This script is licensed under the GNU General Public License version 3.
# The license text should be installed together with this software; otherwise it can be optained at https://www.gnu.org/licenses/gpl-3.0.en.html.

printf '%s\n' \
  "Launching Riven with ScummVM ..." \
  ""  \
  "For further optional options (e.g. graphics scaling an audio), see 'man scummvm'/ 'scummvm --help'." \
  "You can also consult this scrippt, '$0', for hints how to launch Riven manually with ScummVM". \
  "" \
  "In game controls:" \
  "  * Mouse:          Move pointer." \
  "  * Mouse click:    Movement/ Interact." \
  "  * Arrow keys:     Movement." \
  "  * Page Up/ Down:  Look up/ down (if possible at your position)." \
  "  * Space:          Pause the game." \
  "  * Esc:            Skip cutscene." \
  "  * F5:             Menu." \
  "  * Ctrl+o:         Load game." \
  "  * Ctrl+s:         Save game." \
  "" \
  "Enjoy Riven!" \
  ""

scummvm -g hq2x -p /usr/lib/riven "$@" riven
