# Maintainer: Danil Semelenov <mail@danil.mobi>
pkgname=pmenu
pkgver=0.3.2
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
  35f59359bf8b3e81a50e8f8ef16e98e6
  2ee3252e45eec43a0131dfaba8e0a6bf
)

package() {
  install -D -t "$pkgdir/usr/bin" "$srcdir/$pkgname"{,-run}
}
