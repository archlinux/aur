#!/usr/bin/env sh

SCRIPTPATH=/usr/share/cartlife

# Create user data directory
USER_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/cartlife"
mkdir -p "${USER_DATA_DIR}"

# Copy default config if it doesn't exist
if [ ! -f "${USER_DATA_DIR}/acsetup.cfg" ]; then
  cp "${SCRIPTPATH}/acsetup.cfg" "${USER_DATA_DIR}/"
fi

# Link or copy required game data files
cd "${USER_DATA_DIR}"
for f in cartlife.ags cartlife.001 cartlife.002 audio.vox speech.vox; do
  [ -f "${f}" ] || ln -s "${SCRIPTPATH}/${f}" .
done

# Launch game
if [ "$(uname -m)" = "x86_64" ]; then
  export ALLEGRO_MODULES="${SCRIPTPATH}/lib64"
  exec "${SCRIPTPATH}/ags64" "$@" "."
else
  export ALLEGRO_MODULES="${SCRIPTPATH}/lib32"
  exec "${SCRIPTPATH}/ags32" "$@" "."
fi