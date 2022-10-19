#Maintainer: NiNjA <heinep at gmail dot com>

_pkgname=cntb
pkgname=${_pkgname}-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Command-line interface (CLI) for managing products from Contabo like VPS and VDS"
arch=('x86_64')
url="https://github.com/contabo/${_pkgname}"
license=('GPL3')
source=("https://github.com/contabo/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('52f1dd26ea77f98b12ae3c00c7ab32250c1d4bc6516946941362c2e3ba943258')

package() {
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
