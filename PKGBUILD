# Maintainer: Danil Semelenov <mail@danil.mobi>
pkgname=pmenu
pkgver=0.3.3
pkgrel=1
pkgdesc="A dynamic terminal-based menu inspired by dmenu written in Python without dependencies with an optional MRU ordering which could also be used as an application launcher and CtrlP alternative."
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
  9554266840db476365d659d80b94f2b3
  dba6c2ce400aa3fe4c548918d644f256
)

package() {
  install -D -t "$pkgdir/usr/bin" "$srcdir/$pkgname"{,-run}
}
