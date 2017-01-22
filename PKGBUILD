# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>

pkgname=longoverdue
pkgver=0.1.1
pkgrel=1
pkgdesc="System service update management made easy"
arch=('any')
url="https://github.com/Streetwalrus/$pkgname"
license=('MIT')
depends=('python' 'python-click' 'lsof')
source=("https://github.com/Streetwalrus/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f96df14bda1089dde98fcfeefed54cc94fd8c1c4c2be273675da20b294163737')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm 644 longoverdue.hook $pkgdir/usr/share/libalpm/hooks/longoverdue.hook
  install -Dm 755 longoverdue.py $pkgdir/usr/bin/longoverdue
}
