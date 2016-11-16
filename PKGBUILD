# $Id: PKGBUILD 138360 2015-08-14 19:58:36Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=ksuperkey
pkgver=0.4
pkgrel=1
pkgdesc="Allows you to open the application launcher in KDE Plasma Desktop using the Super key"
arch=(i686 x86_64)
url="http://kde-apps.org/content/show.php/ksuperkey?content=154569"
license=(GPL)
depends=(libxtst)
makedepends=()
source=("http://kde-apps.org/CONTENT/content-files/154569-$pkgname-$pkgver.tar.gz")
md5sums=('d07a6e43132ecf76bcbf8ad344979b44')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

