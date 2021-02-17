# Maintainer: Sampson Crowley <sampsonsprojects@gmail.com>
# Upstream Creator: Wil Moore III (https://github.com/wilmoore)

pkgname=php-version
pkgver=0.13.0
pkgrel=2
_builddir="php-version-$pkgver-$pkgrel"
pkgdesc="Chruby-like (a.k.a. simple) script for switching between PHP versions"
arch=('any')
url="https://github.com/wilmoore/php-version/wiki/Installing"
license=('MIT')
conflicts=('phpenv')
source=("https://github.com/wilmoore/php-version/archive/$pkgver.tar.gz")
sha256sums=('5ca48f1e478b691072f4c2c62827f3cc063687cb54fe7c8eb6168a9924991ac5')
sha512sums=('ef79a63c66b79d23b85f3d6140ccca8c3b6329c733c94ad01a0595c118107e9e6c74678e1629b3e2e7e289ba6ac7b9c3535e3e4fe3895e7430fc1cfdf91c1ee6')
provides=('php-version')
install="$pkgname.install"

package() {
  install -dm755 "$pkgdir/usr/lib/$pkgname"

  install -D -m755 "$srcdir/$pkgname-$pkgver/php-version.sh" "$pkgdir/usr/lib/$pkgname/php-version.sh"
  install -D -m755 "$srcdir/$pkgname-$pkgver/bug-report.sh" "$pkgdir/usr/lib/$pkgname/bug-report.sh"
  install -D -m644 "$srcdir/$pkgname-$pkgver/changelog.md" "$pkgdir/usr/lib/$pkgname/changelog.md"
  install -D -m644 "$srcdir/$pkgname-$pkgver/README.md" "$pkgdir/usr/lib/$pkgname/README.md"
}
