# Maintainer: Tomas Storck <storcktomas@gmail.com
# Contributor: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=java-commons-math
_shortname=commons-math
pkgver=3.5
pkgrel=1
pkgdesc='Apache Commons Mathematics Library'
arch=(any)
url='http://commons.apache.org/math/'
license=('APACHE')
depends=('java-runtime')
source=("http://mirror.nyi.net/pub/apache/commons/math/binaries/${_shortname}3-$pkgver-bin.tar.gz")
md5sums=('d3e9e9a8d4b07d0894257cc6953cd2a1')

package() {
  install -Dm644 "$srcdir/${_shortname}3-$pkgver/${_shortname}3-$pkgver.jar" "$pkgdir/usr/share/java/$_shortname/$_shortname.jar"
}
# vim:set ts=2 sw=2 et:
