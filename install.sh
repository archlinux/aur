##
## install.sh -- install script for ut1999-chaosut
##

## post_install NEW_VERSION
post_install() {
    cat << __EOF__
    In order to run a ChaosUT server, add the following lines to the
    respective sections in your UnrealTournament.ini:
        [Engine.GameEngine]
        ServerPackages=UTChaosMap
        ServerPackages=ChaosUTRHUD
        ServerPackages=ChaosUT
        ServerPackages=ChaosUTMiscMuts
        ServerPackages=ChaosGames
__EOF__
}

## post_remove OLD_VERSION
post_remove() {
    cat << __EOF__
    Remove the following lines from the respective sections in your
    UnrealTournament.ini:
        [Engine.GameEngine]
        ServerPackages=UTChaosMap
        ServerPackages=ChaosUTRHUD
        ServerPackages=ChaosUT
        ServerPackages=ChaosUTMiscMuts
        ServerPackages=ChaosGames
__EOF__
}

