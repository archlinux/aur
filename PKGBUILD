# Maintainer Chris Werner Rau <aur@cwrau.io>

_binname=kubectl-node_shell
pkgname=${_binname/_/-}
pkgver=1.10.1
pkgrel=0
pkgdesc="Exec into node via kubectl"
url="https://github.com/kvaps/$pkgname"
license=('APACHE')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('ee2e164680daac5d52a35c56a94d8bd6b178420a716bbde8e8e0e1db640217f55b6ee27fdba3ab95f8a115256fca8cf13a92e6d341e944522c08e71f56046773')

package() {
  install -D -m 0755 $srcdir/$pkgname-$pkgver/$_binname $pkgdir/usr/bin/$_binname
}

#vim: syntax=sh
