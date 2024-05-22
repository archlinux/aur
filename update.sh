makepkg
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO update.sh
git commit -m "update"
git push
rm -rf pkg src jellyfin-rpc
rm -rf *.zst jellyfin-rpc-x86_64-linux jellyfin-rpc.service
rm example.json
