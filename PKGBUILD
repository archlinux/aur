# Maintainer:  <yatsen71@oarchbox1>
pkgname=winmacs-fonts
pkgver=2020.12
pkgrel=1
epoch=
pkgdesc="Windows and Macos mainline fonts"
arch=('i686' 'x86_64')
url="https://developer.apple.com/fonts/"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg)
md5sums=('21cee6ac758229392ad7d45bc9e1e375')
noextract=()

prepare() {
  mkdir -p "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-$pkgver"

  #patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  #./configure --prefix=/usr
  #make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  #make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  #make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
