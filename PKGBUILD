# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

pkgname=librime
pkgver=1.1
pkgrel=1
pkgdesc="Rime input method engine"
arch=('i686' 'x86_64')
url="http://code.google.com/p/rimeime/"
license=('GPL3')
depends=('boost-libs' 'google-glog' 'kyotocabinet' 'opencc' 'yaml-cpp>=0.5')
optdepends=('brise: Rime schema repository')
makedepends=('cmake' 'boost')
source=("http://rimeime.googlecode.com/files/$pkgname-$pkgver.tar.gz")

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

sha512sums=('deb0142fe193f7d445f5008f2cfebb813e4db662f5c474dcb5b8d9f1a9ea8c2e7dc384f3dfae32e7fd13c08f55852124089db08cb96928b98e94128b10847af0')
