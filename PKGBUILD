# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=aurphan
pkgver=20130214
pkgrel=1
pkgdesc="Finds packages in need of maintainers, bug fixes and patches.  Adopt today!"
arch=('any')
url="http://kmkeen.com/aurphan/"
license=('GPL')
depends=('bash' 'curl' 'jshon' 'expac')
makedepends=()
source=(http://kmkeen.com/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('683283a7ecba1aee58c4a2e270adf596')

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}

