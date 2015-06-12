# Contributor: Jozef Riha <jose1711 at gmail dot com>

pkgname=touchtyper
pkgver=1.0rc2
pkgrel=1
pkgdesc="typing trainer - an application suite for training and exercising touchtyping"
url="http://typingtrainer.sourceforge.net/"
arch=('i686')
license=('GPL-2')
depends=('kdelibs3' 'hicolor-icon-theme')
source=("http://downloads.sourceforge.net/project/typingtrainer/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('a979c193039b994b81e0553034f91115')

build() {
cd $srcdir/${pkgname}-1.0
./configure --prefix=/usr --without-arts
make || return 1
make DESTDIR=${pkgdir} install || return 1
}
