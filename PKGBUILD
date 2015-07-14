# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Daniel Isenmann <daniel.isenmann [at] gmx.de>
pkgname=wmcdplayer
pkgver=1.0
pkgrel=2
pkgdesc="Smart dockapp to play CD-AUDIO from any CD-ROM device you have installed"
#url="http://www.dockapps.org/file.php/id/286"
url="https://web.archive.org/web/20121130065910/http://dockapps.windowmaker.org/file.php/id/286"
arch=('i686' 'x86_64')
license=""
depends=('sdl' 'libxpm')
#source=("http://www.dockapps.org/download.php/id/618/$pkgname-$pkgver.tar.gz")
source=("https://web.archive.org/web/20121130065910/http://dockapps.windowmaker.org/download.php/id/618/wmcdplayer-1.0.tar.gz")
md5sums=('0bf85cc51a01e6a575bf031ca984825f')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make
}
package() {
  cd $startdir/src/$pkgname-$pkgver
  mkdir -p $startdir/pkg/usr/bin
  make INSTDIR=$startdir/pkg/usr/bin install
}
