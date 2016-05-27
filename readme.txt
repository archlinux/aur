To build, test and upload new package:

rm -rf pkg src *.xz && makepkg -f
sudo pacman -U *.xz
sudo mg /etc/elephantdrive.config  # need an ED account
sudo systemctl start elephantdrive.service
sudo systemctl status elephantdrive.service
cat /var/log/elephantdrive.log
sudo systemctl stop elephantdrive.service
mksrcinfo
git add
git push
