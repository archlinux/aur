# Maintainer: Marek Darocha <aur@mdarocha.pl>
pkgname=morfeusz2-bin
pkgdesc="Morphological analyser Morfeusz, binary version"
arch=('x86_64')
url="http://morfeusz.sgjp.pl/"
license=('BSD')

pkgver=1.9.16
_pkgdate=20201122
pkgrel=1
epoch=0

depends=('glibc')
makedepends=()

source_x86_64=("http://download.sgjp.pl/morfeusz/${_pkgdate}/Linux/20.04/64/morfeusz2-${pkgver}.sgjp.${_pkgdate}-Linux-amd64.tar.gz")
sha256sums_x86_64=('f16625b2370112727164f61fe3965bcd037475df64c77e00ab1511039e78a52a')

package() {
    cd "${srcdir}/morfeusz2-${pkgver}.sgjp.${_pkgdate}-Linux-amd64/"
    install -Dm 755 bin/*     -t "${pkgdir}/usr/bin/"
    install -Dm 755 include/* -t "${pkgdir}/usr/include/"
    install -Dm 755 lib/*     -t "${pkgdir}/usr/lib/"
}
