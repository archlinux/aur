# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=awesome-terminal-fonts-patched
pkgver=1.0.0
pkgrel=2
pkgdesc="Awesome terminal fonts patching strategy"
arch=("any")
url="https://github.com/gabrielelana/awesome-terminal-fonts"
license=("OFL")
source=("$pkgname-$pkgver::https://github.com/gabrielelana/awesome-terminal-fonts/archive/patching-strategy.zip")
md5sums=("0c79d62c79db1846da944f620408b196")

package() {
  mkdir -p "$pkgdir/usr/share/fonts/$pkgname"
  cp -a "$srcdir/awesome-terminal-fonts-patching-strategy/patched/." "$pkgdir/usr/share/fonts/$pkgname"
}
