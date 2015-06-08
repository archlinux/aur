pkgname=psp-pkg-config
pkgver=1
pkgrel=1
pkgdesc='Support pkg-config script (psp)'
arch=('any')
url=('http://pkg-config.freedesktop.org/')
license=('zlib')
depends=('pkg-config')
source=('psp-pkg-config')
md5sums=('SKIP')

package() {
  install -d "${pkgdir}"/usr/bin
  install -m755 "$srcdir"/psp-pkg-config "${pkgdir}"/usr/bin
}
