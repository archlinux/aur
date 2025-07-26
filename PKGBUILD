# Maintainer: Eshaan Desh eshaan2031@icloud.com
pkgname=votes
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool that tells you how many votes an AUR package has"
arch=('any')
url="https://github.com/eshnd/votes"
license=('MIT')
depends=('python' 'python-requests' 'python-beautifulsoup4')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('SKIP')
package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 votes.py "$pkgdir/usr/bin/votes"
}

