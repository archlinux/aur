#Maintainer: NiNjA <heinep at gmail dot com>

_pkgname=cntb
pkgname=${_pkgname}-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="Command-line interface (CLI) for managing products from Contabo like VPS and VDS"
arch=('x86_64')
url="https://github.com/contabo/${_pkgname}"
license=('GPL3')
source=("https://github.com/contabo/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('3cbb8cb0ac9856e570bc58ed51d6bad6467ab123a2152abf8285e37f98c17c14')

package() {
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
