mkdir -p ~/.hode
cp -u /usr/share/hode/hode.ini ~/.hode
cd ~/.hode
[ -d /usr/share/heart-of-darkness ] && hode --datapath=/usr/share/heart-of-darkness || hode
