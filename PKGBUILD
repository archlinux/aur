# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Based on Artiom Molchanov PKGBUILD for lpairs found on AUR archive

pkgname=lpairs2
pkgver=2.1
pkgrel=1
pkgdesc="A classical memory game"
arch=(x86_64 i686)
url="http://lgames.sourceforge.net/LPairs/"
license=('GPL3')
depends=("sdl2" "sdl2_ttf" "sdl2_image" "sdl2_mixer")
source=(http://prdownloads.sourceforge.net/lgames/$pkgname-$pkgver.tar.gz)
sha256sum=()

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make 
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

sha256sums=('df92980e73d63a334fbbdc33f405af481028d6d7550e8ec8d93371b711394518')
