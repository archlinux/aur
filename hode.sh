mkdir -p ~/.hode
cd ~/.hode
cp -u /usr/share/hode/hode.ini .
[ -d /usr/share/heart-of-darkness ] && hode --datapath=/usr/share/heart-of-darkness || hode
