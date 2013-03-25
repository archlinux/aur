# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

pkgname=librime
pkgver=0.9.8
pkgrel=2
pkgdesc="Rime input method engine"
arch=('i686' 'x86_64')
url="http://code.google.com/p/rimeime/"
license=('GPL3')
depends=('boost' 'google-glog' 'kyotocabinet' 'opencc' 'yaml-cpp')
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

md5sums=('2ef61458bd5b08652ae0ca190af072ba')
