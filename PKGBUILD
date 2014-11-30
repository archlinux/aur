# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=cdspeed
pkgver=0.4
pkgrel=2
pkgdesc="Change the speed of you cdrom"
arch=('i686' 'x86_64')
url="http://linuxfocus.org/~guido/#cdspeed"
license=('GPL')
depends=('sed')
source=(http://linuxfocus.org/~guido/$pkgname-$pkgver.tar.gz)
md5sums=('a719ba7d13e907a072bf484610368f66')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make PREFIX="${pkgdir}/usr" install
}