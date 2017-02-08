# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>

pkgname=longoverdue
pkgver=0.3.2
pkgrel=1
pkgdesc="System service update management made easy"
arch=('any')
url="https://github.com/Streetwalrus/$pkgname"
license=('MIT')
depends=('python' 'python-click' 'lsof')
source=("https://github.com/Streetwalrus/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('52f468a1c493e75e47fd8c27b0bee52b9fdc738d45210abf7c4f6f5aec6bd6c5')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm 644 longoverdue.hook $pkgdir/usr/share/libalpm/hooks/longoverdue.hook
  install -Dm 755 longoverdue.py $pkgdir/usr/bin/longoverdue
}
