#!/bin/sh

homedir=$( getent passwd "$USER" | cut -d: -f6 )
rdir=${homedir}/.local/share/raptor-cos

if [ ! -d "${rdir}" ]; then
  mkdir -p "${rdir}"
fi

for file in /usr/share/raptor-cos/*; do
  if [ ! -h "${rdir}/`basename ${file}`" ]; then
    ln -s "${file}" "${rdir}/"
  fi
done

cd "${rdir}"
./raptor-cos
