# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=aurphan
pkgver=20120310
pkgrel=1
pkgdesc='Finds packages in need of maintainers, bug fixes and patches. Adopt today!'
arch=('any')
url="http://kmkeen.com/aurphan/"
license=('GPL')
depends=('bash' 'curl' 'libxml2' 'jshon' 'expac')
makedepends=()
source=(http://kmkeen.com/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('9a8405e1f4bee0b075d2149b53d2b331')

build() {
  cd "$srcdir/$pkgname"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}

