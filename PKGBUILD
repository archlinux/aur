# Maintainer: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: Stephen Martin <hwkiller at gmail.com>
pkgname=boost-nowide
pkgver=1.58.0
pkgrel=3
pkgdesc="Boost.Nowide is a library implemented by Artyom Beilis that make cross platform Unicode aware programming easier."
arch=("any")
url="http://cppcms.com/files/nowide/html/"
license=('custom')
depends=('boost')
makedepends=('unzip')
options=()
source=("http://cppcms.com/files/nowide/nowide.zip")
md5sums=('60dbd93bc7f860284d080459fce1479e')

package() {
  cd "$srcdir/boost_nowide"
  mkdir -p "$pkgdir/usr/include/"
  cp -r boost "$pkgdir/usr/include/boost"
  chmod 644 "$pkgdir/usr/include/boost/"*
  chmod 755 "$pkgdir/usr/include/boost"
}
