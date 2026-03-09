# Maintainer: Rigami <team@rigami.xyz>
pkgname=rigami-cli-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI for the Rigami quest platform (pre-built)"
arch=('x86_64')
url="https://rigami.xyz"
license=('MIT')
depends=()
provides=('rigami-cli')
conflicts=('rigami-cli')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rigamixyz/rigami-cli/releases/download/v$pkgver/rigami-x86_64-unknown-linux-gnu.tar.gz"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/rigamixyz/rigami-cli/v$pkgver/LICENSE.md")
sha256sums=('SKIP'
            'SKIP')

package() {
  install -Dm755 "rigami" "$pkgdir/usr/bin/rigami"
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
