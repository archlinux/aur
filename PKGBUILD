# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

pkgname=gtk2fontsel
pkgver=0.1
pkgrel=3
pkgdesc="Font selection and preview tool"
arch=('i686' 'x86_64')
url="http://gtk2fontsel.sourceforge.net/"
license=('GPL')
depends=('gtk2')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('f344018b19b6a818795a4c702770cd9d')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  ./configure --prefix=/usr
  make || return 1
  make prefix=${pkgdir}/usr install
}
