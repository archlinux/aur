#!/bin/sh

export SDL_DISABLE_LOCK_KEYS=1 # Work around for bug in Debian/Ubuntu SDL patch.
#export SDL_VIDEO_CENTERED=1    # Centre the screen.  Messes up resizing.

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

for link in announcement art dipscript help index initial_movies movies shader.fs shader.vs sound speech; do
    cp -r /opt/"$pkgname"/data/$link "$HOME/.$pkgname/data/$link"
done

cd "$HOME/.$pkgname"
exec ./dfhack "$@"