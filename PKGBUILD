#Maintainer: NiNjA <heinep at gmail dot com>

_pkgname=cntb
pkgname=${_pkgname}-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Command-line interface (CLI) for managing products from Contabo like VPS and VDS"
arch=('x86_64')
url="https://github.com/contabo/${_pkgname}"
license=('GPL3')
source=("https://github.com/contabo/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('53591ad9bf210af6e17e0fd1d13c51522ca308bca9381f8767c95438de20ebe5')

package() {
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
