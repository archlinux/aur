# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=elasticdump
pkgver=1.0.3
pkgrel=1
pkgdesc="Import and export tools for Elasticsearch"
arch=(any)
url="https://www.npmjs.com/package/elasticdump"
license=("Apache")
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('911c7bfb85dbdf572763639cdf88e203fe5c17a82df64acb3682f13353492c7d')
noextract=("$pkgname-$pkgver.tgz")

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  rm -r "$pkgdir/usr/etc"
}
