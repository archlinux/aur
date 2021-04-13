# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=traitor-bin
_pkgname=traitor
pkgver=0.0.3
pkgrel=1
pkgdesc='Automatic Linux privesc via exploitation of low-hanging fruit.'
arch=('x86_64')
license=('MIT')
url="https://github.com/liamg/$_pkgname"
source=(
  "${url}/releases/download/v${pkgver}/traitor-amd64"
  "${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  'd8309dbfb648a5f80ac88634ffaa3a9d613cd31a785b9902a687edbc2d71d73b'
  'bd63765246691d63235486d156e563ae0264cd6804949f54a1917c1408703fc5'
)

package() {
  install -Dm755 "$srcdir/traitor-amd64" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/${_pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
