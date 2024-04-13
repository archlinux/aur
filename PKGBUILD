# Maintainer: Sterophonick
pkgname=agbplay
_pkgname='agbplay'
pkgver=e685b49
pkgrel=1
pkgdesc='Music player for the most common GBA sound format'
url='https://github.com/ipatix/agbplay'
arch=(x86_64 i686 aarch64)
depends=(boost portaudio ncurses5-compat-libs libsndfile jsoncpp)
makedepends=(base-devel)
source=(git+https://github.com/ipatix/agbplay)
md5sums=('SKIP')
license=('gplv3')

package() {
  mkdir -p $pkgdir/usr/bin
  cd $srcdir/agbplay
  make -j$(nproc)
  cp ./agbplay $pkgdir/usr/bin
}
