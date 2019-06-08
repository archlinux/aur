# Maintainer: ston3o

pkgname=rdcli
pkgver=1.5.1
pkgrel=1
pkgdesc="A simple CLI tool to unrestrict links with real-debrid.com"
arch=('any')
url="https://github.com/ston3o/rdcli"
license=('GPL3')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=($pkgname-$pkgver.tgz)
sha1sums=('35e53cd53b783aaba52cda77cd50cfe8755e1e69')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  chmod go-w "$pkgdir/usr/lib/node_modules"
}

