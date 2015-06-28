# Maintainer: Petteri Tolonen <petteri dot tolonen at gmail dot com>

pkgname=freedink-dfarc
pkgver=3.12
pkgrel=2
pkgdesc="Frontend and .dmod installer for GNU FreeDink"
arch=('i686' 'x86_64')
url="http://www.freedink.org/"
license=('GPL3')
depends=('bzip2' 'hicolor-icon-theme' 'shared-mime-info' 'wxgtk>=2.8' 'xdg-utils')
makedepends=('intltool')
source=(http://ftp.gnu.org/gnu/freedink/dfarc-$pkgver.tar.gz)
sha256sums=('222a84cc91967abce4d86fb4ed8ba43455b818aecdb8487b0fe52d76ade29a83')
install=freedink-dfarc.install

package() {

   cd $srcdir/dfarc-$pkgver/
   
   ./configure --prefix=/usr --disable-desktopfiles
   make
   make install DESTDIR=$pkgdir

}
