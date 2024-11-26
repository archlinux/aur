#Maintainer: NiNjA <heinep at gmail dot com>

_pkgname=cntb
pkgname=${_pkgname}-bin
pkgver=1.4.12
pkgrel=1
pkgdesc="Command-line interface (CLI) for managing products from Contabo like VPS and VDS"
arch=('x86_64')
url="https://github.com/contabo/${_pkgname}"
license=('GPL3')
source=("https://github.com/contabo/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('e601b4a1502a799b3d36fd9d4b5f603d682368acde304d6288438f695b84b283')

package() {
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
