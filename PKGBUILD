# Contributor: Colin Keenan <colinnkeenan at gmail dot com>

# After installing this package (nautilus-data), you can get gnome-search-tool for Xfce without nautilus/gnome-desktop.
# 
# Either install gnome-search-tool-no-nautilus from AUR, 
# or
# use abs as follows: 
# 
# sudo abs extra/gnome-search-tool
# mkdir ~/abs
# cp -r /var/abs/extra/gnome-search-tool/ ~/abs
# cd ~/abs/gnome-search-tool 
# [edit PKGBUILD and change depends=('nautilus' ...) to depends=('nautilus-data' ...)] 
# makepkg -si
# 
# The advantage of gnome-search-tool-no-nautilus from AUR over rebuilding with abs is that upgrades will be easier.

pkgname=nautilus-data
pkgver=3.38.2
pkgrel=1
pkgdesc="Nautilus data files for gnome-search-tool"
url="http://www.ubuntuupdates.org/package/core/trusty/main/base/nautilus-data"
arch=('any')
license=('GPL')
conflicts=('nautilus')
install=${pkgname}.install

source=(http://security.ubuntu.com/ubuntu/pool/main/n/nautilus/nautilus-data_3.38.2-1ubuntu3_all.deb)
md5sums=('539a2f0bb3e34b8093bce1b2e6f3e0c7')

package() {
  tar xvf data.tar.xz -C "$pkgdir"
}
