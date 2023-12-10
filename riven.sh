#!/bin/sh

# This script is licensed under the GNU General Public License version 3.
# The license text should be installed together with this software; otherwise it can be optained at https://www.gnu.org/licenses/gpl-3.0.en.html.

_rivendir='/usr/lib/riven'

printf '%s\n' \
  "Launching Riven with ScummVM ..." \
  ""  \
  "For further optional options (e.g. graphics scaling an audio), see 'man scummvm'/ 'scummvm --help'." \
  "You can also consult this script, '$0', for hints how to launch Riven manually with ScummVM". \
  "" \
  "For custom settings, you can add Riven to your local ScummVM configuration by just launching 'scummvm' (without options) and then click 'Add Game...' and point to '${_rivendir}'. Then you can launch Riven with your customisations from your ScummVM GUI instead of using this script '$0'." \
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

scummvm -g opengl --stretch-mode=fit -p "${_rivendir}" "$@" riven
