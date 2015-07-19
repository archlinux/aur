#!/bin/bash
#
# ultratron.sh
#
###############################################################################
cd "$(dirname $(realpath $0))"

JVM="/usr/bin/java"

# XMODIFIERS is cleared here to prevent SCIM screwing up keyboard input
_JAVA_OPTIONS= XMODIFIERS= "${JVM}" \
    -server \
    -Dorg.lwjgl.librarypath="/usr/share/lwjgl/native/linux" \
    -Dorg.lwjgl.util.NoChecks=false \
    -Djava.net.preferIPv4Stack=true \
    -Dnet.puppygames.applet.Launcher.resources=resources-hib.dat \
    -Dnet.puppygames.applet.Game.gameResource=game.hib \
    -XX:MaxGCPauseMillis=3 \
    -XX:+TieredCompilation \
    -XX:Tier2CompileThreshold=70000 \
    -XX:+DoEscapeAnalysis \
    -Xms64m \
    -Xmx256m \
    -Xincgc \
    -cp Ultratron.jar:music.jar:fx-mono.jar:fx-stereo.jar:images.jar:gfx.jar:fonts.jar:data-hib.jar:common-cp-java6.jar:common.jar:spgl-lite.jar:lwjgl.jar:lwjgl_util.jar:gson.jar:jinput.jar:ogg.jar:gamecommerce.jar:steampuppy-public.jar:remote.jar \
    net.puppygames.applet.Launcher \
    "$@"

exit 0

#
# EOF
#
###############################################################################

