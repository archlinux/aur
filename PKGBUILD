# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=elasticdump
pkgver=1.1.0
pkgrel=1
pkgdesc="Import and export tools for Elasticsearch"
arch=(any)
url="https://www.npmjs.com/package/elasticdump"
license=("Apache")
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('16409b06e3139f133d1f529e081955cc2b2f808cae0caf49cc3f318f8067fb46')
noextract=("$pkgname-$pkgver.tgz")

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  rm -r "$pkgdir/usr/etc"
}
