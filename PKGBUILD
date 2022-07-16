# Maintainer: pkfbcedkrz <pkfbcedkrz@gmail.com>
pkgname=xorg-fonts-cronyx-100dpi
pkgver=2.3.8
pkgrel=1
pkgdesc="X.org cyrillic fonts (Cronyx collection)"
arch=('any')
url="https://packages.debian.org/bullseye/xfonts-cronyx-75dpi"
license=('GPL3')
conflicts=('xorg-fonts-cyrillic')
source=("http://ftp.us.debian.org/debian/pool/main/x/xfonts-cronyx/xfonts-cronyx-100dpi_${pkgver}-9_all.deb")
md5sums=('5758edc458cbd9f1d957a1106f0bb2ef')

package() {
    tar xf data.tar.xz
    mv usr $pkgdir/
}
