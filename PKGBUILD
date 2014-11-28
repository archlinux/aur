# Contributor: Thomas Boerger <devel@ghcif.de>
pkgname=gnopaster
pkgver=0.0.9
pkgrel=2
pkgdesc="gnopaste's submitter"
url="http://gnopaste.sourceforge.net/"
depends=("perl" "perl-libwww"
 "perl-config-simple")
arch=("i686" "x86_64")
license=("GPL")
source=("http://dl.sourceforge.net/sourceforge/gnopaste/${pkgname}-${pkgver}.pl.gz")
md5sums=("f4dc2382fb96feb8894f1f8c346c5987")
 
build() {
        install -Dm 755 ${startdir}/src/${pkgname}-${pkgver}.pl ${startdir}/pkg/usr/bin/${pkgname} || return 1
}
