#Maintainer: NiNjA <heinep at gmail dot com>

_pkgname=cntb
pkgname=${_pkgname}-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Command-line interface (CLI) for managing products from Contabo like VPS and VDS"
arch=('x86_64')
url="https://github.com/contabo/${_pkgname}"
license=('GPL3')
source=("https://github.com/contabo/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('90733d056d2086c2ec19ebff2b36cc3785f32c2cf118d93e6d189595c785c2b5')

package() {
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
