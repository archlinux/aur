# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

pkgname=librime
pkgver=1.2.20141205
pkgrel=5
pkgdesc="Rime input method engine"
arch=('i686' 'x86_64')
url="http://code.google.com/p/rimeime/"
license=('GPL3')
depends=('boost-libs' 'google-glog' 'kyotocabinet' 'opencc' 'yaml-cpp' 'marisa')
optdepends=('brise: Rime schema repository')
makedepends=('cmake' 'boost' 'git')
source=("git+https://github.com/rime/librime.git#commit=cbe2ffcbbde147a741b1d03f4f5b4e408f6ccdb8")
sha512sums=('SKIP')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
