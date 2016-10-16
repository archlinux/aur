#!/usr/bin/bash -e

[[ ! -f generate-dictionary.sh ]] && { echo "generate-dictionary.sh not found."; exit 1; }

sed -i \
    -e '1s/sh/sh -e/' \
    -e 's/ruby \(.*\)/ruby -EUTF-8 \1/g' \
    generate-dictionary.sh \
    edict-katakana-english/generate-dictionary.sh

# Comment out the specifying versions and initial cleanup
# cp $srcdir/KEN_ALL.CSV to chimei/
# Specify $srcdir/JIGYOSYO.CSV
# Modify mozc-\$MOZCVER to mozc
# Remove making xz archive
sed -i \
    -e 's/^\(MOZCVER=.*\|DICVER=.*\|NICODIC=.*\)/#&/' \
    -e '/rm -rf mozc-$MOZCVER/s/^/#/i' \
    -e '/echo "extract official mozc..."/,+1s/^/#/ig' \
    -e '/rm -f \*\.zip/,+6s/^/#/ig' \
    -e '/cd chimei/a cp -f ../../KEN_ALL.CSV .' \
    -e 's|JIGYOSYO.CSV|../../JIGYOSYO.CSV|' \
    -e 's|mozc-\$MOZCVER|mozc|g' \
    -e '/# compress mozc-ut/,+4s/^/#/ig' \
    -e 's|^cp -r docs/|cp -r docs-ut/|' \
    generate-dictionary.sh

sed -i \
    -e '5,6s/^/#/ig' \
    edict-katakana-english/generate-dictionary.sh

#sed -i '71s/s\[5\]/& != "" and &/' chimei/get-entries.rb
