#!/usr/bin/fish
rm *.tar.zst
rm *.tar.gz
cd repo
# git pull
tar cfz ../repo.tar.gz *
cd ..
makepkg -sic
