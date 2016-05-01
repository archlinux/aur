for i in `cat list_foreign.txt`
do
  yaourt -S "$i" --noconfirm --needed
done
