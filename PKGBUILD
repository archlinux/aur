# Generated on: Thu Nov 17 19:47:52 2016
# Maintainer: jcherqui

pkgname=rdcli
pkgver=1.3.1
pkgrel=1
pkgdesc="A simple CLI tool to unrestrict links with real-debrid.com"
arch=('any')
url="https://github.com/jcherqui/rdcli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=($pkgname-$pkgver.tgz)
sha1sums=('f64eb7656b289097dc4a6043199ec380b1fb7957')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
  rm -r "$pkgdir"/usr/etc
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$pkgname/LICENSE*" "$pkgdir/usr/share/licenses/$pkgname/"
}

