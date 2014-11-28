# Contributor: Jaroslav Lichtblau <tu@dragonlord.cz>

pkgname=cdspeed
pkgver=0.4
pkgrel=2
pkgdesc="Change the speed of you cdrom."
arch=('i686')
url="http://linuxfocus.org/~guido/#cdspeed"
license=('GPL')
depends=('sed')
source=(http://linuxfocus.org/~guido/$pkgname-$pkgver.tar.gz)

md5sums=('a719ba7d13e907a072bf484610368f66')

build() {
  cd "${srcdir}/$pkgname-$pkgver"

  make || return 1
  make PREFIX="${pkgdir}/usr" install || return 1
}