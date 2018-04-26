# Maintainer: deusstultus <0x574EDC8EE28E6872A2D9CC66939C852925E4A9F0>

pkgname=simploripsum
pkgver=0.3
_gitrev='4468ecfb'
pkgrel=3
pkgdesc="A simple cli interface for loripsum.net lorem ipsum API"
arch=('any')
url="https://github.com/deusstultus/simploripsum"
license=('GPL')
depends=('bash')

source=("git+git://github.com/deusstultus/simploripsum.git#commit=${_gitrev}")
sha256sums=('SKIP')

package() {
  install -D -m755 "$srcdir/$pkgname/simploripsum.sh" "$pkgdir/usr/bin/simploripsum"
}

# vim:set sw=2 ts=2 et:

