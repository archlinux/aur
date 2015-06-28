# Maintainer: Petteri Tolonen <petteri dot tolonen at gmail dot com>

pkgname=freedink-dfarc
pkgver=3.12
pkgrel=1
pkgdesc="Frontend and .dmod installer for GNU FreeDink"
arch=('i686' 'x86_64')
url="http://www.freedink.org/"
license=('GPL3')
depends=('bzip2' 'hicolor-icon-theme' 'shared-mime-info' 'wxgtk>=2.8' 'xdg-utils')
makedepends=('intltool')
source=(http://ftp.gnu.org/gnu/freedink/dfarc-$pkgver.tar.gz)
md5sums=('1c24ba41cf1ef532415f13a04f279099')
install=freedink-dfarc.install

package() {

   cd $startdir/src/dfarc-$pkgver/
   
   ./configure --prefix=/usr --disable-desktopfiles
   make
   make install DESTDIR=$pkgdir

}
