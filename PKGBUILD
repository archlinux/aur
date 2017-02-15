# Maintainer: Arkham <arkham at archlinux dot us>
# Contributor: TheBenj <thebenj88 *AT* gmail *DOT* com>

pkgname=stardork
pkgver=0.7
pkgrel=2
pkgdesc="An ncurses-based space shooter"
arch=('i686' 'x86_64')
url="http://stardork.sourceforge.net/"
license=('GPL')
depends=('ncurses')
source=("https://downloads.sourceforge.net/stardork/stardork-$pkgver.tar.gz")
sha256sums=('4ff31291bd091a6d61b5b34c01ed12bb6d21b5496397fd6ca30c0763565a31f5')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 stardork "$pkgdir"/usr/bin/stardork
  install -Dm644 README "$pkgdir"/usr/share/doc/stardork/README
}
