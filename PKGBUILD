# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

pkgname=librime
pkgver=1.0
pkgrel=2
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

sha512sums=('79f51174043e0ff524f8af090fd1d0a21301b4e5e530c772648ff59894d39135d15c53c0f4d197895c301defca2e084635eb222464dd20859ab3bdbc6ae8fb2c')
