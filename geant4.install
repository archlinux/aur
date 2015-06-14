#!/bin/sh

_init() {
  variables=("G4LEDATA" \
    "G4LEVELGAMMADATA" \
    "G4NEUTRONHPDATA" \
    "G4NEUTRONXSDATA" \
    "G4PIIDATA" \
    "G4RADIOACTIVEDATA" \
    "G4REALSURFACEDATA" \
    "G4SAIDXSDATA" \
    "G4ABLADATA" )

shell=("sh" "csh")

existing="existing"
path="/etc/profile.d"
}
_clean(){
    for _ext in ${shell[*]}
    do
        rm -f $existing.${_ext}
    done
}
_read() {
    _init
    for _varname in ${variables[*]}
    do
        for _ext in ${shell[*]}
        do
            sed -n /${_varname}/p ${path}/geant4.${_ext} >> $existing.${_ext}
	done
    done
}
_keep() {
    _init
    for _ext in ${shell[*]}
    do
        cat $existing.${_ext} >> ${path}/geant4.${_ext}
    done
    _clean
}

pre_upgrade() {
    _read
}
post_upgrade() {
    _keep
}
