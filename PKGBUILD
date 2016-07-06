# Maintainer: Michael Straube <michael_straube web de>

pkgname=vlc-pause-click-plugin
pkgver=0.3.0
pkgrel=1
pkgdesc='This plugin allows you to pause/play a video by clicking on the video image'
arch=('i686' 'x86_64')
license=('LGPL')
url='https://github.com/nurupo/vlc-pause-click-plugin'
depends=('vlc')
source=("https://github.com/nurupo/$pkgname/archive/$pkgver.tar.gz")
sha1sums=('89a74eebee80f79434ba80fbb54fc5eb87bec8d0')

build() {
  cd $pkgname-$pkgver/vlc-2.2.x+

  make
}

package() {
  cd $pkgname-$pkgver/vlc-2.2.x+

  make DESTDIR="$pkgdir" install
}
