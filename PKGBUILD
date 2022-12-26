# Maintainer: pkfbcedkrz <pkfbcedkrz@gmail.com>
pkgname=xorg-fonts-cronyx-100dpi
pkgver=2.3.8
pkgrel=3
pkgdesc="X.org cyrillic fonts (PCF version). Intended for use with Qt applications that do not fully support OTB fonts (eg, pcmanfm-qt)"
arch=('any')
url="https://packages.debian.org/bullseye/xfonts-cronyx-100dpi"
license=('GPL3')
source=("http://ftp.us.debian.org/debian/pool/main/x/xfonts-cronyx/xfonts-cronyx-100dpi_${pkgver}-9_all.deb")
md5sums=('3aabd3a4590d57322381267694c53762')

package() {
    tar xf data.tar.xz
    mv usr $pkgdir/
}
