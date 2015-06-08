# Maintainer: Dusan Maliarik <dusan.maliarik[at]gmail[dot]com>

pkgname=imgur
pkgver=0.1
pkgrel=2
pkgdesc="Upload image to imgur.com image sharing service."
arch=('any')
url="http://imgur.com/apps"
license=('GPL')
depends=('curl' 'bash')
makedepends=()
groups=()
source=(http://imgur.com/tools/imgurbash.sh)
md5sums=('c5fd5a619959b4e31ba815c8a772f8bb')

build() {
  cd "$srcdir"
  mv imgurbash.sh imgur
  chmod +x imgur
}

package() {
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/imgur $pkgdir/usr/bin
}
