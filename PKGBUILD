# Maintainer: Lukas Sabota <LTsmooth42 _at_ gmail _dot_ com>
pkgname=bpm-git
pkgver=2018.10.26
pkgrel=2
pkgdesc="Blue Pink Metronome for Qt5.  Easy to use metronome controlled by the keyboard".
arch=('i686' 'x86_64')
url="https://github.com/cfillion/bpm"
license=('GPL')
depends=('qt5-base' 'qt5-multimedia' )
makedepends=('tup')
source=(git+https://github.com/cfillion/bpm)
md5sums=('SKIP')

build() {
  cd bpm
  tup
}

package() {
  cd bpm
  install -D -m755 bin/bpm "$pkgdir/usr/bin/bpm"
  install -D -m644 bpm.desktop "$pkgdir/usr/share/applications/bpm.desktop"
}

