# Maintainer: Jozef Riha <jose1711@gmail.com>

pkgname=mdfextract
pkgver=0.1
pkgrel=3
pkgdesc="tool to extract audio data from MDF/MDS audio cd images to wav or raw files"
url="http://www.sqweek.com/sqweek/index.php?p=5"
license=("GPL-2")
arch=('i686' 'x86_64')
depends=('glibc')
source=(http://www.sqweek.com/sqweek/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('104f3b31ddfa3a245a14f1564c402c3c')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  make
}

package() {
  install -Dm755 "$srcdir/${pkgname}-${pkgver}/mdfextract" $pkgdir/usr/bin/mdfextract
}

