# Maintainer: Eshaan Desh eshaan2031@icloud.com
pkgname=fuck
pkgver=1.0.0
pkgrel=1
pkgdesc="Makes sudo and the f-word one and the same"
arch=('any')
url="https://github.com/eshnd/f-bomb"
license=('MIT')
depends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3b991fdaf110eb731a94fc23430104d82e77053bcb7deb6f4331e07b65c4e370')
package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 votes.py "$pkgdir/usr/bin/votes"
}

