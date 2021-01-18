# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kube-linter
pkgname=$_pkgname-bin
pkgver=0.1.6
pkgrel=0
pkgdesc="KubeLinter is a static analysis tool that checks Kubernetes YAML files and Helm charts to ensure the applications represented in them adhere to best practices."
url="https://github.com/stackrox/$_pkgname"
license=('APACHE')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname-linux.tar.gz")
arch=('x86_64')
sha512sums=('429a7227a72fcf89fde715fdac7b180c958667341e48112643c61a006186957abb9afdac2f1587a17337e3d7f3033d9ee682b9460ae0c63d6a9c7158b041c31e')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname
}

#vim: syntax=sh
