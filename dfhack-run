#!/bin/sh

pkgname=dwarffortress

# Check for user DF directory

if [[ ! -d "$HOME/.$pkgname" ]]; then
    mkdir -p "$HOME/.$pkgname/data"
    ln -s /opt/"$pkgname"/raw "$HOME/.$pkgname/raw"
    ln -s /opt/"$pkgname"/libs "$HOME/.$pkgname/libs"
    cp -rn /opt/"$pkgname"/data/init "$HOME/.$pkgname/data/init"
fi

# Check for user DFHack installation

if [[ ! -d "$HOME/.$pkgname/hack" ]]; then
    ln -s /opt/"$pkgname"/hack "$HOME/.$pkgname/hack"
    ln -s /opt/"$pkgname"/stonesense "$HOME/.$pkgname/stonesense"
    ln -s /opt/"$pkgname"/dfhack "$HOME/.$pkgname/dfhack"
    ln -s /opt/"$pkgname"/dfhack.init-example "$HOME/.$pkgname/dfhack.init-example"
    ln -s /opt/"$pkgname"/dfhack-run "$HOME/.$pkgname/dfhack-run"
fi

cd "$HOME/.$pkgname"
exec ./dfhack-run "$@"