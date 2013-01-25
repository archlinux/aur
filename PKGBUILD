# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

pkgname=librime
pkgver=0.9.7
pkgrel=4
pkgdesc="Rime input method engine"
arch=('i686' 'x86_64')
url="http://code.google.com/p/rimeime/"
license=('GPL3')
depends=('boost' 'google-glog' 'kyotocabinet' 'opencc' 'yaml-cpp0.3')
optdepends=('brise: Rime schema repository')
makedepends=('cmake')
source=("http://rimeime.googlecode.com/files/$pkgname-$pkgver.tar.gz")

build() {
  cd "${srcdir}/$pkgname"
  make
}

package() {
  cd "${srcdir}/$pkgname"
  make DESTDIR="$pkgdir" install
}

md5sums=('732fe5258ab4fced26e61475cdcffdb1')
