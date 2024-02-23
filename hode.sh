mkdir -p ~/.hode
cd ~/.hode
cp -n /usr/share/hode/* .
hode `a=/usr/share/heart-of-darkness-demo;[ -d $a ] && echo --datapath=$a`
