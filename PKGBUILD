# Maintainer: Philippe Cavalaria <philippe.cavalaria at moc.liamg>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=ksuperkey
pkgver=0.4
pkgrel=1
pkgdesc="Allows you to open the application launcher in KDE Plasma Desktop using the Super key"
arch=(i686 x86_64)
url="https://www.linux-apps.com/content/show.php/ksuperkey?content=154569"
license=(GPL)
depends=(libxtst)
makedepends=()
source=("https://dl.opendesktop.org/api/files/download/id/1460972657/154569-$pkgname-$pkgver.tar.gz")
md5sums=('d07a6e43132ecf76bcbf8ad344979b44')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

