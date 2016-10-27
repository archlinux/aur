#!/usr/bin/bash -e

[[ ! -f generate-dictionary.sh ]] && { echo "generate-dictionary.sh not found."; exit 1; }

sed -i.bak \
    -e '1s/sh/sh -e/' \
    -e 's/ruby \(.*\)/ruby -EUTF-8 \1/g' \
    generate-dictionary.sh \
    edict-katakana-english/generate-dictionary.sh

# 1) Comment out specifying versions and initial cleanup
# 2) cp $srcdir/KEN_ALL.CSV to chimei/
# 3) Specify $srcdir/JIGYOSYO.CSV
# 4) Modify mozc-\$MOZCVER to mozc
# 5) Comment out making xz archive
sed -i.bak \
    -e 's/^\(MOZCVER=.*\|DICVER=.*\|NICODIC=.*\)/#&/g' \
    -e '/rm -rf mozc-$MOZCVER/s/^/#/g' \
    -e '/echo "extract official mozc..."/,+1s/^/#/g' \
    -e '/rm -f \*\.zip/,+6s/^/#/g' \
    -e '/cd chimei/a cp -f ../../KEN_ALL.CSV .' \
    -e 's|JIGYOSYO.CSV|../../JIGYOSYO.CSV|' \
    -e 's|mozc-\$MOZCVER|mozc|g' \
    -e '/# compress mozc-ut/,+4s/^/#/g' \
    generate-dictionary.sh

sed -i.bak \
    -e '/^\(#\|ruby\|$\)/!s/^/#/g' \
    edict-katakana-english/generate-dictionary.sh
