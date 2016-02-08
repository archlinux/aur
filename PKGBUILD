# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=elasticdump
pkgver=1.0.1
pkgrel=1
pkgdesc="Import and export tools for Elasticsearch"
arch=(any)
url="https://www.npmjs.com/package/elasticdump"
license=("Apache")
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('53e813a48583fb3621c35cc0f3288c9dfa791d84954fad1111f87b857c589a46')
noextract=("$pkgname-$pkgver.tgz")

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  rm -r "$pkgdir/usr/etc"
}
