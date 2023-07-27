# Maintainer: Nicholas Boyd Isacsson <nicholas@isacsson.se>

pkgname=pandoc-rss
pkgver=1.0.1
pkgrel=1
pkgdesc='Generate an RSS feed from markup content and metadata'
arch=('any')
url="https://github.com/chambln/$pkgname"
license=('MIT')
depends=('pandoc')
source=("pandoc-rss-$pkgver.zip::$url/archive/refs/tags/$pkgver.zip")
sha256sums=('c8ccc509c3cd73983b42b518bb99f9668155aebaa51a46977666b6b58e21cc18')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}

