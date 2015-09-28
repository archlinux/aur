# Maintainer: Danil Semelenov <mail@danil.mobi>
pkgname=pmenu
pkgver=0.2.3
pkgrel=1
pkgdesc="Dynamic menu like dmenu for terminal written in Python without dependencies with optional sorting by usage, application launcher and CtrlP alternative."
url=https://gitlab.com/sgtpep/pmenu
arch=(any)
license=(GPL3)
depends=(python)
optdepends=(
  "bash: pmenu-run application launcher"
  "grep: pmenu-run application launcher"
)
source=(
  https://gitlab.com/sgtpep/$pkgname/raw/v$pkgver/pmenu
  https://gitlab.com/sgtpep/$pkgname/raw/v$pkgver/pmenu-run
)
md5sums=(
  8ec028eb1dd5c9382d0f02f54801ea93
  2d8c673e6c5583449ffea1255f9e7833
)

package() {
  install -D -t "$pkgdir/usr/bin" "$srcdir/$pkgname"{,-run}
}
