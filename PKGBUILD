# Contributor: Storm Dragon <stormdragon2976@gmail.com>
pkgname=jot
pkgver=1.0
pkgrel=1
pkgdesc="Really fast single line notes for the CLI."
arch=('any')
url="https://github.com/2mb-solutions/jot"
source=("${url}/archive/${pkgver}.tar.gz")
license=('unlicense')
optdepends=('xclip: Clipboard support')
provides=("$pkgname")
conflicts=("$pkgname")
md5sums=('dfc825534cc7fad4870854324e77d64f')

package()
 {
  tar xf ${pkgver}.tar.gz -C "$srcdir"
  cd "$srcdir/${pkgname}-${pkgver}"
  install -d "$pkgdir/usr/bin/"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  }

# vim:set ts=2 sw=2 et:
