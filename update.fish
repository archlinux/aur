#!/usr/bin/fish
rm *.tar.zst
rm *.tar.gz
cd repo
git pull
cd ..
rm -rf pkgrepo
cp -r repo pkgrepo
cd pkgrepo
rm -rf build .deps
tar cfz ../repo.tar.gz *
cd ..
makepkg -si
rm *.tar.gz
rm -rf pkgrepo
rm -rf pkg src
