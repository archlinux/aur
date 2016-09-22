#!/bin/sh
cd /usr/share/sheeplifter/
java -Xmx150m -Djava.library.path=/usr/share/lwjgl2/native/linux -cp jme/jme.jar:jme/jme-audio.jar:jme/jme-effects.jar:jme/jme-scene.jar:jme/jme-terrain.jar:jme/jme-gamestates.jar:jme/jme-model.jar:/usr/share/lwjgl2/jar/lwjgl.jar:/usr/share/lwjgl2/jar/lwjgl/lwjgl_util.jar:jorbis/jorbis-0.0.17.jar:sheeplifter.jar dk.impact.sheeplifter.SheeplifterGame
