#!/usr/bin/bash -e

[[ ! -f generate-dictionary.sh ]] && { echo "generate-dictionary.sh not found."; exit 1; }

sed -i \
    -e '1s/sh/sh -e/' \
    -e 's/ruby \(.*\)/ruby -EUTF-8 \1/g' \
    generate-dictionary.sh \
    edict-katakana-english/generate-dictionary.sh

# 1) Comment out specifying versions and initial cleanup
# 2) cp $srcdir/KEN_ALL.CSV to chimei/
# 3) Specify $srcdir/JIGYOSYO.CSV
# 4) Modify mozc-\$MOZCVER to mozc
# 5) Comment out making xz archive
sed -i \
    -e 's/^\(MOZCVER=.*\|DICVER=.*\|NICODIC=.*\)/#&/g' \
    -e '/rm -rf mozc-$MOZCVER/s/^/#/i' \
    -e '/echo "extract official mozc..."/,+1s/^/#/ig' \
    -e '/rm -f \*\.zip/,+6s/^/#/ig' \
    -e '/cd chimei/a cp -f ../../KEN_ALL.CSV .' \
    -e 's|JIGYOSYO.CSV|../../JIGYOSYO.CSV|' \
    -e 's|mozc-\$MOZCVER|mozc|g' \
    -e '/# compress mozc-ut/,+4s/^/#/ig' \
    generate-dictionary.sh

sed -i \
    -e '/rm -f edict.*/,/gzip -dk edict.*/s/^/#/ig' \
    edict-katakana-english/generate-dictionary.sh
