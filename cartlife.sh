#!/usr/bin/env sh

# Create user data directory
USER_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/cartlife"
mkdir -p "${USER_DATA_DIR}"

# Copy default config if it doesn't exist
if [ ! -f "${USER_DATA_DIR}/acsetup.cfg" ]; then
  cp "/usr/share/cartlife/acsetup.cfg" "${USER_DATA_DIR}/"
fi

# Link or copy required game data files
cd "${USER_DATA_DIR}"
for f in cartlife.ags cartlife.001 cartlife.002 audio.vox speech.vox; do
  [ -f "${f}" ] || ln -s "/usr/share/cartlife/${f}" .
done

# Launch game
export ALLEGRO_MODULES="/opt/cartlife"
export LD_LIBRARY_PATH="${ALLEGRO_MODULES}:${LD_LIBRARY_PATH}"
exec "/usr/lib/cartlife" "$@" "."