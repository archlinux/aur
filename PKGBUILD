# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=aurphan
pkgver=20110720
pkgrel=1
pkgdesc="Finds packages in need of maintainers, bug fixes and patches.  Adopt today!"
arch=('any')
url="http://kmkeen.com/aurphan/"
license=('GPL')
depends=('bash' 'curl' 'libxml2' 'jshon' 'expac')
makedepends=()
source=(http://kmkeen.com/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('eaf6638f0222761c9b72664843c7c638')

build() {
  cd "$srcdir/$pkgname"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}

