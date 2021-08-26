# Maintainer Chris Werner Rau <aur@cwrau.io>

_binname=kubectl-node_shell
pkgname=${_binname/_/-}
pkgver=1.5.3
pkgrel=0
pkgdesc="Exec into node via kubectl"
url="https://github.com/kvaps/$pkgname"
license=('APACHE')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('87c2f4570fb961c9583b54a53a044992e1a35ff40fe187f250fb82607e6fcf70c30a284cbf976ad7f2769965832fa94b501051edafd3c090bda4ca29eba5b963')

package() {
  install -D -m 0755 $srcdir/$pkgname-$pkgver/$_binname $pkgdir/usr/bin/$_binname
}

#vim: syntax=sh

