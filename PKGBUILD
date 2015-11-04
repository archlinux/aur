# Maintainer: Danil Semelenov <mail@danil.mobi>
pkgname=pmenu
pkgver=0.2.5
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
  cc57291e33e99fbe1630f1883d96b102
  f359b480070d59b0faea2c34492192af
)

package() {
  install -D -t "$pkgdir/usr/bin" "$srcdir/$pkgname"{,-run}
}
