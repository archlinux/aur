# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Vlad M. <vlad@archlinux.net>

pkgname=elasticdump
pkgver=3.3.0
pkgrel=1
pkgdesc="Import and export tools for Elasticsearch"
arch=(any)
url="https://www.npmjs.com/package/elasticdump"
license=("Apache")
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('743ad12529889b48a726a73dd5b4469f7db69560f4887032fb5fdac9775e9c9a')
noextract=("$pkgname-$pkgver.tgz")

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  rm -r "$pkgdir/usr/etc"
}
