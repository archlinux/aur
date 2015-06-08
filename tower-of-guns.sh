#!/bin/sh

DDIR="${HOME}/.TowerOfGuns"
BDIR="/opt/tower-of-guns/Binaries/Linux"

if [ ! -d ${DDIR} ]; then
    mkdir -p "${DDIR}/Binaries/Linux"
    ln -fs "${BDIR}/steam_appid.txt" "${DDIR}/Binaries/Linux/steam_appid.txt"
    ln -fs "${BDIR}/lib" "${DDIR}/Binaries/Linux/lib"
    ln -fs "/opt/tower-of-guns/UDKGame" "${DDIR}/UDKGame"
    ln -fs "/opt/tower-of-guns/Engine" "${DDIR}/Engine"
fi

cd "${DDIR}/Binaries/Linux"
exec "${BDIR}/UDKGame-Linux" $@
