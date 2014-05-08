# Maintainer: <predrg@gmail.com>

pkgname=alsamixer.app
pkgver=0.1
pkgrel=4
pkgdesc="Simple dockable mixer application for Linux with ALSA drivers."
arch=('i686' 'x86_64')
#url="http://www.dockapps.org/file.php/id/253"
url="https://web.archive.org/web/20130814154026/http://dockapps.windowmaker.org/file.php/id/253"
license=('GPL')
groups=()
depends=('libx11' 'alsa-lib' 'libxpm')
#source=(https://web.archive.org/web/20130814154026/http://www.dockapps.org/download.php/id/517/AlsaMixer.app-$pkgver.tar.gz)
source=(http://dockapps.windowmaker.org/download.php/id/517/AlsaMixer.app-$pkgver.tar.gz)
source=(http://distfiles.gentoo.org/distfiles/AlsaMixer.app-$pkgver.tar.gz)
md5sums=('df3548182e10370f75c1c978e4a1b64d')

build() {
  cd "$srcdir"/AlsaMixer.app-$pkgver
  make
}

package() {
  cd "$srcdir"/AlsaMixer.app-$pkgver
  install -D -m755 AlsaMixer.app "$pkgdir"/usr/bin/AlsaMixer.app
}
