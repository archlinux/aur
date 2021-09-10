makepkg --printsrcinfo > .SRCINFO
git add --all .
echo "Write commit comment!"
read input
git commit -m "$input"
git push -u origin master
