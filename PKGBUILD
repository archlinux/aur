# Maintainer: Tomasz Gorol <gavian at tlen dot pl>

pkgname=ftmenu
pkgver=0.4.0
pkgrel=1
pkgdesc="Fluxbox menu icon tray"
arch=('i686' 'x86_64')
url="http://ftmenu.sourceforge.net/"
license=('GPL')
groups=('')
depends=('fluxbox' 'gtk2')
source=("http://sourceforge.net/projects/ftmenu/files/ftmenu/ftmenu-0.4/${pkgname}-${pkgver}.tar.gz/download")

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
   make DESTDIR=${pkgdir} install
}
md5sums=('7a56d92be35970e66c45abe72d50653e')
