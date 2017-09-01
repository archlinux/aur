#!/bin/bash

PWD=$(pwd)
cd /usr/share/fiosign
BCPROV=$(ls -1 bcprov-*-*.jar)
java -cp $BCPROV:signer_client.jar cz.fio.signer.client.gui.Main
cd $PWD
