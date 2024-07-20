makepkg
makepkg --printsrcinfo > .SRCINFO
rm -rf pkg src jellyfin-rpc
rm -rf *.zst jellyfin-rpc-x86_64-linux jellyfin-rpc.service
git add PKGBUILD .SRCINFO update.sh jellyfin-rpc-git.install
git commit -m "update"
git push
