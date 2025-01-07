# Maintainer: Sterophonick
pkgname=iquecrypt-git
_pkgname='iquecrypt-git'
pkgver=55a190d
pkgrel=1
pkgdesc='Extracts keys and init vectors from ticket.sys on an iQue Player'
url='https://github.com/jbop1626/iquecrypt'
arch=(x86_64 i686 aarch64)
makedepends=(base-devel)
source=(git+https://github.com/jbop1626/iquecrypt)
md5sums=('SKIP')
license=('gplv3')

package() {
  mkdir -p $pkgdir/usr/bin
  cd $srcdir/iquecrypt/build/linux
  make
  mv ../../bin/linux/iquecrypt $pkgdir/usr/bin
}
