# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Michal Bozon <bozonm@vscht.cz>

pkgname=geekcode
pkgver=1.7.3
pkgrel=1
pkgdesc="Classic self-classification code generator"
arch=('i686' 'x86_64')
url="http://www.geekcode.com/"
license=('GPL')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('b794916a8875f71f1442f6e70432d6de')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
}
