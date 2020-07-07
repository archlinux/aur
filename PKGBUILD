# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=aurphan
pkgver=20140212
pkgrel=3
pkgdesc="Finds packages in need of maintainers, bug fixes and patches.  Adopt today!"
arch=('any')
url="http://kmkeen.com/aurphan/"
license=('GPL')
depends=('bash' 'curl' 'jshon' 'expac')
makedepends=()
source=(http://kmkeen.com/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('803a20a4b2e46635c5bebc4472d6289b6d86fc93033da0d6c57d7e7b2bd496018f45f0156846ef377f801a0a60eff7a7d67c22db6a6159f18f66abda1d034fd7')

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}

