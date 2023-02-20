# Maintainer Chris Werner Rau <aur@cwrau.io>

_binname=kubectl-node_shell
pkgname=${_binname/_/-}
pkgver=1.7.0
pkgrel=0
pkgdesc="Exec into node via kubectl"
url="https://github.com/kvaps/$pkgname"
license=('APACHE')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('74efd8625438d7f25edf2ff9d9661ae263253d478e46f962dc404d8ae9983838906374a72ca3fa04404b4a995237f5685194b3133d8081a45ea2441426a89866')

package() {
  install -D -m 0755 $srcdir/$pkgname-$pkgver/$_binname $pkgdir/usr/bin/$_binname
}

#vim: syntax=sh

