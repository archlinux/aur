#!/bin/sh

_varname='G4NEUTRONHPDATA'
_packagename='geant4-neutronhpdata'
_foldername='G4NDL'
_dataversion=4.5

_add() {
    echo "export ${_varname}=/usr/share/${_packagename}/${_foldername}${_dataversion}" >> /etc/profile.d/geant4.sh
    echo "setenv ${_varname} /usr/share/${_packagename}/${_foldername}${_dataversion}" >> /etc/profile.d/geant4.csh
}

_remove() {
    sed -i "/${_varname}/d" /etc/profile.d/geant4.sh
    sed -i "/${_varname}/d" /etc/profile.d/geant4.csh
}

pre_install() {
    _remove
}
post_install() {
    _add
}
pre_upgrade() {
    _remove
}
post_upgrade() {
    _add
}
pre_remove() {
    _remove
}
post_remove() {
    _remove
}
