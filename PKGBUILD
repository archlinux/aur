# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
pkgname=jot
pkgver=1.2
pkgrel=1
pkgdesc="Really fast single line notes for the CLI."
arch=('any')
url="https://git.2mb.codes/~stormdragon2976/${pkgname}"
source=("${url}/archive/${pkgver}.tar.gz")
license=('unlicense')
optdepends=('xclip: Clipboard support')
provides=("$pkgname")
conflicts=("$pkgname")
md5sums=('dbe4de7cf6f5e56bc4cacea6f7dd4c19')

package()
 {
  tar xf ${pkgver}.tar.gz -C "$srcdir"
  cd "$srcdir/${pkgname}-${pkgver}"
  install -d "$pkgdir/usr/bin/"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  }

# vim:set ts=2 sw=2 et:
