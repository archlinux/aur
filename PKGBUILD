# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
pkgname=jot
pkgver=1.1
pkgrel=2
pkgdesc="Really fast single line notes for the CLI."
arch=('any')
url="https://github.com/stormdragon2976/$pkgname"
source=("${url}/archive/${pkgver}.tar.gz")
license=('unlicense')
optdepends=('xclip: Clipboard support')
provides=("$pkgname")
conflicts=("$pkgname")
md5sums=('f7bfe4ea61f8f6203dd512a56051a4e7')

package()
 {
  tar xf ${pkgver}.tar.gz -C "$srcdir"
  cd "$srcdir/${pkgname}-${pkgver}"
  install -d "$pkgdir/usr/bin/"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  }

# vim:set ts=2 sw=2 et:
