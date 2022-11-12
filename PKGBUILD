# Maintainer: Diego Souza <diegosouza.br@gmail.com>
pkgname=sq-bin
_pkgname=sq
pkgver=0.15.11
pkgrel=1
pkgdesc="Swiss-army knife for data"
arch=('x86_64')
url="https://sq.io"
license=('MIT')
source_x86_64=("https://github.com/neilotoole/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('c9d1875e901d7eaf3c58ab5dd69470d36d5cc067217bdd334f0cd89c61065337')

package() {
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/licenses/${_pkgname}
    mkdir -p $pkgdir/usr/share/doc/${_pkgname}

    cp $srcdir/${_pkgname} $pkgdir/usr/bin
    cp $srcdir/LICENSE $pkgdir/usr/share/licenses/${_pkgname}/
    cp $srcdir/README.md $pkgdir/usr/share/doc/${_pkgname}/
}
