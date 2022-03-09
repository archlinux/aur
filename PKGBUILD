# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=traitor-bin
_pkgname=traitor
pkgver=0.0.13
pkgrel=1
pkgdesc='Automatic Linux privesc via exploitation of low-hanging fruit.'
arch=('x86_64')
license=('MIT')
url="https://github.com/liamg/$_pkgname"
source=(
  "${url}/releases/download/v${pkgver}/traitor-amd64"
  "${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=('c87966a280098a45c90dac27666f3f01f6b6999e7b08719a8035f1355d696ad4'
            '845adf2dfd545d5353f1023ff7e106a2e96ecb4c740c2e103e8af74b610e2aa4')

package() {
  install -Dm755 "$srcdir/traitor-amd64" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/${_pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
