# Maintainer: Arthur Deierlein <arthur at deierlein dot ch>

_pkgname=v-analyzer
pkgname="$_pkgname-bin"
pkgver=0.0.4
_pkgver="$pkgver-beta.1"
pkgrel=1
pkgdesc='Bring IDE features for V programming languages in VS Code, Vim and other editors '
url=https://github.com/vlang/v-analyzer
arch=('x86_64')
license=('MIT')
depends=('vlang')
makedepends=()
checkdepends=()
source=("$_pkgname-$pkgver.zip::https://github.com/vlang/v-analyzer/releases/download/$_pkgver/v-analyzer-linux-$CARCH.zip" "LICENSE::https://raw.githubusercontent.com/vlang/v-analyzer/$_pkgver/LICENSE")
b2sums=(SKIP SKIP)

package() {
  install -Dm755 "./v-analyzer" "$pkgdir/usr/bin/v-analyzer"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
