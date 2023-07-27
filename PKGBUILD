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
sha256sums=('eca7145ec1cb1ca6bd848b8bf10161bf387f52bde4ef1a03483db59bc7390520')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}

