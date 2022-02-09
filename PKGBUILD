# This is repackage of the original Qt4 binary.
# I did not compile the binary.
# The reason of this AUR submission is for easier install.
# 
# Maintainer: Mochammad Naufal Septifiandi <septifiandinaufal@gmail.com>
# Original Packager: Viktor Drobot <linux776@gmail.com>
pkgname=qt4-bin
pkgver=4.8.7
pkgrel=35
pkgdesc="Prebuilt binary for Qt4. Alternative for faster installing."
arch=(x86_64)
url="https://desolve.ru/archrepo/x86_64/"
license=('GPL3' 'LGPL' 'FDL' 'custom')
depends=('sqlite' 'ca-certificates' 'fontconfig' 'libgl' 'libxrandr' 'libxv'
        'libxi' 'alsa-lib' 'xdg-utils' 'hicolor-icon-theme' 'desktop-file-utils'
        'libmng' 'dbus')
provides=('qt4')
conflicts=('qt' 'qt4')
replaces=('qt<=4.8.4')
source=("$url/qt4-$pkgver-$pkgrel-$arch.pkg.tar.zst")
options=(!strip)
md5sums=('SKIP')

package() {
   mv usr "$pkgdir/"
}
