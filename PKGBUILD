# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=eviltris
pkgver=0.7
pkgrel=1
pkgdesc="A tetris like game, but the 'random' order of piece selection is different than the standard 'random' number generator method"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/eviltris"
license=('GPL')
depends=('sdl' 'mesa')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('d824425e19836dd2ae95c99268614d83')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
}