# Maintainer: Nicholas Boyd Isacsson <nicholas@isacsson.se>

pkgname=cbonsai-bin
pkgver=1.4.2
pkgrel=1
pkgdesc='A bonsai tree generator, written in C using ncurses'
arch=('any')
url="https://gitlab.com/jallbrit/cbonsai-bin"
license=('GPL3')
makedepends=('scdoc')
depends=('gcc' 'ncurses')
provides=('cbonsai')
conflicts=('cbonsai')
source=("$url/-/archive/v$pkgver/cbonsai-bin-v$pkgver.zip" 'merger')
sha256sums=('b14a26f2405575075b482ffa1b5698c479e100027c271fa44fa2e310279b6d4a')

package() {
  cd "$srcdir/cbonsai-bin-v$pkgver"
  make DESTDIR="$pkgdir/" PREFIX="/usr" MANDIR="/usr/share/man" install
}


