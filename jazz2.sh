DIR=/share/Jazz²\ Resurrection/Source
mkdir -p ~/.local"$DIR"
cp -n /usr"$DIR"/* ~/.local"$DIR"
[ -f ~/.local"$DIR"/Anims.j2a ] && rm ~/.local"$DIR"/AnimsSw.j2a || cp -n /usr"$DIR"/../AnimsSw.j2a ~/.local"$DIR"
jazz2
