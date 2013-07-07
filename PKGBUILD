# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

pkgname=librime
pkgver=0.9.9
pkgrel=3
pkgdesc="Rime input method engine"
arch=('i686' 'x86_64')
url="http://code.google.com/p/rimeime/"
license=('GPL3')
depends=('boost' 'google-glog' 'kyotocabinet' 'opencc' 'yaml-cpp>=0.5')
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

md5sums=('bd705cd3e4c7ab6e47d983b07044769f')
