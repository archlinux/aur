# Maintainer: Radek Podgorny <radek@podgorny.cz>
pkgname=speedscope
pkgver=1.13.0
pkgrel=1
pkgdesc="A fast, interactive web-based viewer for performance profiles."
arch=(any)
url="https://github.com/jlfwong/speedscope"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=('!emptydirs')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" $pkgname@$pkgver
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
}

