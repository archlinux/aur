# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>

pkgname=longoverdue
pkgver=0.5.1
pkgrel=1
pkgdesc="System service update management made easy"
arch=('any')
url="https://github.com/Streetwalrus/$pkgname"
license=('MIT')
depends=('python' 'python-click' 'lsof')
source=("https://github.com/Streetwalrus/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('8ff67fd1428db2f5a085fe4ce1795b3450cb8b9a0c6b938a567c69978fd7eb73')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm 644 longoverdue.hook $pkgdir/usr/share/libalpm/hooks/longoverdue.hook
  install -Dm 755 longoverdue.py $pkgdir/usr/bin/longoverdue
}
