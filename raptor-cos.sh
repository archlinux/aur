#!/bin/sh

homedir=$( getent passwd "$USER" | cut -d: -f6 )
rdir=${homedir}/.local/share/raptor-cos
srdir=/usr/share/raptor-cos

if [ ! -d "${rdir}" ]; then
  mkdir -p "${rdir}"
fi

for file in "${srdir}"/*.GLB "${srdir}"/SoundFont.sf2; do
  if [ ! -h "${rdir}/`basename ${file}`" ]; then
    ln -s "${file}" "${rdir}/"
  fi
done

if [ ! -f "${rdir}/SETUP.INI" ]; then
  cp "${srdir}/SETUP.INI" "${rdir}/SETUP.INI"
fi

cd "${rdir}"
${srdir}/raptor-cos
