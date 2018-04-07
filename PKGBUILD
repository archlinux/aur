# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>

pkgname=longoverdue
pkgver=0.5
pkgrel=1
pkgdesc="System service update management made easy"
arch=('any')
url="https://github.com/Streetwalrus/$pkgname"
license=('MIT')
depends=('python' 'python-click' 'lsof')
source=("https://github.com/Streetwalrus/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0aaa51c2b46432b4c11cb56044068e594007a89e97013a4ae649a2ad573710ba')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm 644 longoverdue.hook $pkgdir/usr/share/libalpm/hooks/longoverdue.hook
  install -Dm 755 longoverdue.py $pkgdir/usr/bin/longoverdue
}
