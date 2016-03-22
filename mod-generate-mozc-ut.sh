#!/usr/bin/bash -e

[[ ! -f generate-mozc-ut.sh ]] && { echo "generate-mozc-ut.sh not found."; exit 1; }

sed -i \
    -e '1s/bash/bash -e/' \
    -e 's/ruby \(.*\)/ruby -EUTF-8 \1 || exit 1/g' \
    generate-mozc-ut.sh \
    edict-katakana-english/generate-katakanago.sh

sed -i \
    -e 's/^\(MOZCVER=.*\|DICVER=.*\|NICODIC=.*\)/#&/' \
    -e 's| KEN_ALL.CSV.r| ../../x-ken-all.csv|' \
    -e '/rm -f chimei\/\*.CSV*/d' \
    -e '/rm -f chimei\/\*.zip/d' \
    -e '/rm -f chimei\/gen_zip_code_seed.py/d' \
    -e '/rm -rf ..\/mozc-$MOZCVER\//d' \
    -e 's|\(mozc-\$MOZCVER\)|\1/src|g' \
    -e '/# unpack official mozc/,+6d' \
    -e '/wget http:\/\/www.post.japanpost.jp\/zipcode\/dl\/kogaki\/zip\/ken_all.zip/,+13d' \
    -e '/# modify zip code data/,+3d' \
    -e '/# PKGBUILD/,+2d' \
    -e '/# compress mozc-ut/,+4d' \
    generate-mozc-ut.sh

sed -i \
    -e '/# get edict/,+1d' \
    -e 's|gzip -d edict.gz|ln -sf \.\./\.\./edict-${DICVER} edict|' \
    edict-katakana-english/generate-katakanago.sh

sed -i '71s/s\[5\]/& != "" and &/' chimei/get-chimei-entries.rb
