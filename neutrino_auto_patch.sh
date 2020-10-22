#!/usr/bin/env bash
FILE_ID=1bEfY03waqFqcKO1180L4yv-piKNgqmnB
FILE_NAME=NEUTRINO.zip
curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=${FILE_ID}" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"  
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=${FILE_ID}" -o ${FILE_NAME}
unzip NEUTRINO.zip
cd NEUTRINO
perl -0777 -pe 's/libnetcdf.so.15/libnetcdf.so.18/g' bin/NEUTRINO > bin/NEUTRINO.old
perl -0777 -pe 's/so.1.71.0/so.1.72.0/g' NSF/bin/currennt > NSF/bin/currennt.old
perl -0777 -pe 's/so.1.71.0/so.1.72.0/g' NSF/bin/currennt.old > NSF/bin/currennt
perl -0777 -pe 's/libcublas.so.10/libcublas.so.11/g' NSF/bin/currennt > NSF/bin/currennt.old
xxd  NSF/bin/currennt.old | sed "s/3021 f60e 0000 09/3121 f60e 0000 01/g" | xxd -r > NSF/bin/currennt 
xxd  bin/NEUTRINO.old | sed "s/3021 f60e 0000 07/3121 f60e 0000 01/g" | xxd -r > bin/NEUTRINO
chmod +x bin/NEUTRINO
chmod +x bin/WORLD
chmod +x bin/musicXMLtoLabel
chmod +x bin/NSF_IO
chmod +x NSF/Run.sh
chmod +x NSF/bin/currennt
chmod +x Run.sh