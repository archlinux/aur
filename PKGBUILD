# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

pkgname=librime
pkgver=1.2.20141112
pkgrel=1
pkgdesc="Rime input method engine"
arch=('i686' 'x86_64')
url="http://code.google.com/p/rimeime/"
license=('GPL3')
depends=('boost-libs' 'google-glog' 'kyotocabinet' 'opencc' 'yaml-cpp' 'marisa')
optdepends=('brise: Rime schema repository')
makedepends=('cmake' 'boost' 'git')
source=("git+https://github.com/lotem/librime.git#commit=1e708aef32b0915b257963ccd5a836d37a7d636a")
sha512sums=('SKIP')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
