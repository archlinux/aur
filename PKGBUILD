# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>

pkgname=longoverdue
pkgver=0.5.3
pkgrel=1
pkgdesc="System service update management made easy"
arch=('any')
url="https://github.com/Streetwalrus/$pkgname"
license=('MIT')
depends=('python' 'python-click' 'lsof')
source=("https://github.com/Streetwalrus/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d4c182e3e6b3e82ca4be6b7222efbb1531b661b771c4129a636fde662cb47e4e')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm 644 longoverdue.hook $pkgdir/usr/share/libalpm/hooks/longoverdue.hook
  install -Dm 755 longoverdue.py $pkgdir/usr/bin/longoverdue
}
