# Maintainer: Danil Semelenov <mail@danil.mobi>
pkgname=pmenu
pkgver=0.3.0
pkgrel=1
pkgdesc="Dynamic menu like dmenu for terminal written in Python without dependencies with optional sorting by usage, application launcher and CtrlP alternative."
url=https://github.com/sgtpep/pmenu
arch=(any)
license=(GPL3)
depends=(python)
optdepends=(
  "bash: pmenu-run application launcher"
  "grep: pmenu-run application launcher"
)
source=(
  https://raw.githubusercontent.com/sgtpep/$pkgname/v$pkgver/pmenu
  https://raw.githubusercontent.com/sgtpep/$pkgname/v$pkgver/pmenu-run
)
md5sums=(
  89cf08aeb39601d1fa8121a341a518cb
  2ee3252e45eec43a0131dfaba8e0a6bf
)

package() {
  install -D -t "$pkgdir/usr/bin" "$srcdir/$pkgname"{,-run}
}
