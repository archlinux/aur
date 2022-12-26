# Maintainer: pkfbcedkrz <pkfbcedkrz@gmail.com>
pkgname=xorg-fonts-cronyx-75dpi
pkgver=2.3.8
pkgrel=2
pkgdesc="X.org cyrillic fonts (PCF version). Intended for use with Qt applications that do not fully support OTB fonts (eg, pcmanfm-qt)"
arch=('any')
url="https://packages.debian.org/bullseye/xfonts-cronyx-75dpi"
license=('GPL3')
source=("http://ftp.us.debian.org/debian/pool/main/x/xfonts-cronyx/xfonts-cronyx-75dpi_${pkgver}-9_all.deb")
md5sums=('4f590ee0e14d24482f50c20a13418866')

package() {
    tar xf data.tar.xz
    find usr -type f -iname '*ho_*.pcf*' -delete
    find usr -type f -iname '*hbo_*.pcf*' -delete
    mv usr $pkgdir/
}
