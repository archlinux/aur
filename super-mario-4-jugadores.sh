#!/usr/bin/bash
# modified from foobar2000 launch script
# original script by Mario Finelli

sm4j_installation_dir_default="/usr/share/super-mario-4-jugadores"
sm4j_installation_dir="$HOME/.super-mario-4-jugadores"
wine_prefix="$HOME/.local/share/wineprefixes/super-mario-4-jugadores"

# Symlink stuff
mkdir -p "${sm4j_installation_dir}" || exit 1
# Delete broken symlinks
find -L "${sm4j_installation_dir}" -type l -delete
# Update existing symlinks, add new symlinks
cp -urs "${sm4j_installation_dir_default}/"* "${sm4j_installation_dir}" 2> /dev/null

# Switches: use -something instead of /something to avoid confusion with Unix paths
# Also convert Unix paths to Windows paths.
declare -a args

for arg; do
    if [[ "${arg:0:1}" = "-" ]]; then
        args+=("${arg/#-//}")
    else
        args+=("$(winepath -w "$arg")")
    fi
done

WINEPREFIX="${wine_prefix}" wine "${sm4j_installation_dir}/SM4JLegacy.exe" "${args[@]}"
