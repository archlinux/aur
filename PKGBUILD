# Maintainer: Diego Souza <diegosouza.br@gmail.com>
pkgname=sq-bin
_pkgname=sq
pkgver=0.15.4
pkgrel=1
pkgdesc="Swiss-army knife for data"
arch=('x86_64')
url="https://sq.io"
license=('MIT')
source_x86_64=("https://github.com/neilotoole/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz")
sha256sums_x86_64=('432b2a19caa988f87c94a4a7e8bc0e2efacb8092459b752e29b265f16b6b6b25')

package() {
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/licenses/${_pkgname}
    mkdir -p $pkgdir/usr/share/doc/${_pkgname}

    cp $srcdir/${_pkgname} $pkgdir/usr/bin
    cp $srcdir/LICENSE $pkgdir/usr/share/licenses/${_pkgname}/
    cp $srcdir/README.md $pkgdir/usr/share/doc/${_pkgname}/
}
