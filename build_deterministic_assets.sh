#!/bin/sh
# set -e 
mkdir build
find . -exec touch -d @0 {} +
chmod -R 777 .
# Build OAX assets
zip -X -9r build/oax-pak0.pk3 CREDITS
zip -X -9r build/oax-pak0.pk3 COPYING
cd mods
zip -X -9r ../build/oax-pak0.pk3 * -x \*svn* -x *.exe
cd ../

# Build missionpack assets
zip -X -9r build/mp-pak0.pk3 CREDITS
zip -X -9r build/mp-pak0.pk3 COPYING
cd missionpack
zip -X -9r ../build/mp-pak0.pk3 * -x \*svn* -x *.exe
cd ../

# Build uncut assets
zip -X -9r build/uncut.pk3 CREDITS
zip -X -9r build/uncut.pk3 COPYING
cd packs/uncut
zip -X -9r ../../build/uncut.pk3 * -x \*svn* -x *.exe
cd ../../

# Build baseoa assets
zip -X -9r build/pak0.pk3 default.cfg
zip -X -9r build/pak0.pk3 CREDITS
zip -X -9r build/pak0.pk3 COPYING
zip -X -9r build/pak0.pk3 README
zip -X -9r build/pak0.pk3 LINUXNOTES
zip -X -9r build/pak0.pk3 CHANGES
zip -X -9r build/pak0.pk3 productid.txt
zip -X -9r build/pak0.pk3 gfx/* -x \*svn*
zip -X -9r build/pak0.pk3 icons/* -x \*svn*
zip -X -9r build/pak0.pk3 menu/* -x \*svn*
zip -X -9r build/pak0.pk3 models/ammo/* -x \*svn*
zip -X -9r build/pak0.pk3 models/flags/* -x \*svn*
zip -X -9r build/pak0.pk3 models/gibs/* -x \*svn*
zip -X -9r build/pak0.pk3 models/mapobjects/* -x \*svn*
zip -X -9r build/pak0.pk3 models/misc/* -x \*svn*
zip -X -9r build/pak0.pk3 models/players/grism/* -x \*svn*
zip -X -9r build/pak0.pk3 models/players/sarge/* -x \*svn*
zip -X -9r build/pak0.pk3 models/powerups/* -x \*svn*
zip -X -9r build/pak0.pk3 models/weaphits/* -x \*svn*
zip -X -9r build/pak0.pk3 models/weapons2/* -x \*svn*
zip -X -9r build/pak0.pk3 models/ammo/* -x \*svn*
zip -X -9r build/pak0.pk3 models/ammo/* -x \*svn*
zip -X -9r build/pak0.pk3 scripts/* -x \*svn* -x scripts/player*.shader  -x scripts/bots.txt
zip -X -9r build/pak0.pk3 sound/items/* -x \*svn*
zip -X -9r build/pak0.pk3 sound/misc/* -x \*svn*
zip -X -9r build/pak0.pk3 sound/movers/* -x \*svn*
zip -X -9r build/pak0.pk3 sound/weapons/* -x \*svn*
zip -X -9r build/pak0.pk3 sound/world/* -x \*svn*
zip -X -9r build/pak0.pk3 sound/feedback/hit.wav -x \*svn*
zip -X -9r build/pak0.pk3 sound/feedback/hit_teammate.wav -x \*svn*
zip -X -9r build/pak0.pk3 sprites/* -x \*svn*
zip -X -9r build/pak0.pk3 textures/effects/* -x \*svn*
zip -X -9r build/pak0.pk3 textures/oafx/* -x \*svn*
zip -X -9r build/pak0.pk3 textures/oa/* -x \*svn*
zip -X -9r build/pak0.pk3 textures/detail/* -x \*svn*
zip -X -9r build/pak0.pk3 vm/* -x \*svn*
zip -X -9r build/pak0.pk3 sound/player/announcer/* -x \*svn*
zip -X -9r build/pak0.pk3 sound/player/fry.wav -x \*svn*
zip -X -9r build/pak0.pk3 sound/player/gibimp1.wav -x \*svn*
zip -X -9r build/pak0.pk3 sound/player/gibimp2.wav -x \*svn*
zip -X -9r build/pak0.pk3 sound/player/gibimp3.wav -x \*svn*
zip -X -9r build/pak0.pk3 sound/player/gibsplt1.wav -x \*svn*
zip -X -9r build/pak0.pk3 sound/player/gurp1.wav -x \*svn*
zip -X -9r build/pak0.pk3 sound/player/gurp2.wav -x \*svn*
zip -X -9r build/pak0.pk3 sound/player/land1.wav -x \*svn*
zip -X -9r build/pak0.pk3 sound/player/talk.wav -x \*svn*
zip -X -9r build/pak0.pk3 sound/player/watr_in.wav -x \*svn*
zip -X -9r build/pak0.pk3 sound/player/watr_out.wav -x \*svn*
zip -X -9r build/pak0.pk3 sound/player/watr_un.wav -x \*svn*
zip -X -9r build/pak0.pk3 sound/player/footsteps/* -x \*svn*
zip -X -9r build/pak0.pk3 sound/player/sarge/* -x \*svn*

zip -X -9r build/pak1-maps.pk3 levelshots/* -x \*svn*
zip -X -9r build/pak1-maps.pk3 maps/*.bsp -x \*svn*

zip -X -9r build/pak2-players.pk3 models/players/* -x \*svn* -x models/players/grism/* -x models/players/sarge/*
zip -X -9r build/pak2-players.pk3 sound/player/* -x \*svn* -x sound/player/announcer/* -x sound/player/footsteps/* -x sound/player/sarge/*
zip -X -9r build/pak2-players.pk3 scripts/player_* -x \*svn*

zip -X -9r build/pak3-music.pk3 music/* -x \*svn*

zip -X -9r build/pak4-textures.pk3 textures/* -x \*svn* -x textures/effects/* -x textures/oafx/* -x textures/oa/* -x textures/detail/*
zip -X -9r build/pak4-textures.pk3 env/* -x \*svn*

zip -X -9r build/pak5-TA.pk3 models/weapons/* -x \*svn*
zip -X -9r build/pak5-TA.pk3 ui/* -x \*svn*
zip -X -9r build/pak5-TA.pk3 gfx/ui/* -x \*svn*
zip -X -9r build/pak5-TA.pk3 fonts/* -x \*svn*

zip -X -9r build/pak6-misc.pk3 video/* -x \*svn*
zip -X -9r build/pak6-misc.pk3 botfiles/* -x \*svn*
zip -X -9r build/pak6-misc.pk3 sound/feedback/* -x \*svn*
zip -X -9r build/pak6-misc.pk3 sound/teamplay/* -x \*svn*
zip -X -9r build/pak6-misc.pk3 scripts/bots.txt -x \*svn*
zip -X -9r build/pak6-misc.pk3 maps/*.aas -x \*svn*
# zip -X -9r build/pak6-misc.pk3 demos/* -x *svn*

sha256sum build/*
