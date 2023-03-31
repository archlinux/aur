# Maintainer: Jérémie Roquet <jroquet@arkanosis.net>
pkgname=binjr-bin
pkgver=3.11.0
pkgrel=2
provides=("binjr")
pkgdesc="Time Series Data Browser"
arch=("x86_64")
url="https://binjr.eu/"
license=("Apache")
source=("https://github.com/binjr/binjr/releases/download/v${pkgver}/binjr-${pkgver}_linux-amd64.tar.gz" "https://github.com/binjr/binjr/releases/download/v${pkgver}/binjr-${pkgver}_linux-amd64.tar.gz.asc")
sha512sums=('SKIP' 'SKIP')
validpgpkeys=("BAF5C2D20BE017155EE108152065AD47B326EB92")

package() {
    install -d $pkgdir/{opt/binjr,usr/bin,usr/share/doc/binjr}
    mv $srcdir/$pkgver $pkgdir/opt/binjr
    ln -s /opt/binjr/$pkgver/binjr $pkgdir/usr/bin/binjr
    ln -s /opt/binjr/$pkgver/README.html $pkgdir/usr/share/doc/binjr/README.html
}
