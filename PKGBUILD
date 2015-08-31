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
md5sums=('109b93bd034fecd5389b68d9bc177547'
         '4df8c8964b8ba2f00f6c97aece344e94'
         '0d47d8bdcb9f2da1e5b709a63311b776')

package()
 {
  tar xf ${pkgver}.tar.gz -C "$srcdir"
  cd "$srcdir/${pkgname}-${pkgver}"
  install -d "$pkgdir/usr/bin/"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  }

# vim:set ts=2 sw=2 et:
