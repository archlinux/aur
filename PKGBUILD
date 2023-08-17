# Maintainer Chris Werner Rau <aur@cwrau.io>

_binname=kubectl-node_shell
pkgname=${_binname/_/-}
pkgver=1.8.0
pkgrel=0
pkgdesc="Exec into node via kubectl"
url="https://github.com/kvaps/$pkgname"
license=('APACHE')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('4fab1768b178175ece393f28f067ee0754cd31d37ff8770bce7335ba78127b313b278e1c3469e3191445561610b55003506a497135ad303f042afd48762924ad')

package() {
  install -D -m 0755 $srcdir/$pkgname-$pkgver/$_binname $pkgdir/usr/bin/$_binname
}

#vim: syntax=sh
