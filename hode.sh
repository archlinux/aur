mkdir -p ~/.hode
cd ~/.hode
cp -n /usr/share/hode/* .
hode `A=/usr/share/heart-of-darkness;[ -d $A ] && echo --datapath=$A`
