# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=ggps
pkgver=0.2
pkgrel=1
pkgdesc="Program using the GTK+ toolkit to display GPS satellite position and signal strength information"
arch=('i686' 'x86_64')
url="http://www.brouhaha.com/~eric/software/ggps/"
license=('GPL')
depends=('gtk')
source=(http://www.brouhaha.com/~eric/software/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('3fe65ea0e5b5928f7c74ca9f58812f9482a6a3a6b3261f0e32fba19eca957b9c')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
}
