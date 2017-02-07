#! /bin/bash

progName="kindleforpc"
progRealPath="/usr/share/$progName"
progHome="$HOME/.config/$progName"
progBin="Kindle.exe"

# Symlink stuff
mkdir -p "$progHome" || exit 1
# Delete broken symlinks
find -L "$progHome" -type l -delete
# Update existing symlpiinks, add new symlinks
cp -urs "$progRealPath/"* "$progHome" 2> /dev/null

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

wine "$progHome/$progBin" "${args[@]}"
