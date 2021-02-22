# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=traitor-bin
_pkgname=traitor
pkgver=0.0.1
pkgrel=1
pkgdesc='Automatic Linux privesc via exploitation of low-hanging fruit.'
arch=('x86_64')
license=('unknown')
url="https://github.com/liamg/$_pkgname"
source=("${url}/releases/download/v${pkgver}/traitor-amd64")
sha256sums=('3cb401fdba1a0e74389ac9998005805f1d3e8ed70018d282f5885410d48725e1')

package() {
  install -Dm755 "$srcdir/traitor-amd64" "$pkgdir/usr/bin/$_pkgname"
}
