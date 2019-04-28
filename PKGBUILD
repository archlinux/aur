# Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

pkgname=xiaomitool-v2
pkgver=9.4.10
pkgrel=1
pkgdesc='Modding of Xiaomi devices made easy for everyone'
arch=(any)
license=(custom)
url=https://www.xiaomitool.com/V2/
source=(https://github.com/francescotescari/XMT/releases/download/v$pkgver/XMT2_Linux_Debian_$pkgver.deb)
sha256sums=('7d329e1043dca0b38d162a3f34906b2cb57ec81a1f8e5ee8adf01a62783e5ba8')

build() {
  cd $srcdir
  ar x $(basename $source)
  tar xf data.tar.xz
}

package() {
  cd $srcdir
  cp -r opt res usr $pkgdir
}
