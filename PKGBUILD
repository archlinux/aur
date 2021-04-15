# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kube-linter
pkgname=$_pkgname-bin
pkgver=0.2.0
pkgrel=0
pkgdesc="KubeLinter is a static analysis tool that checks Kubernetes YAML files and Helm charts to ensure the applications represented in them adhere to best practices."
url="https://github.com/stackrox/$_pkgname"
license=('APACHE')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname-linux.tar.gz")
arch=('x86_64')
sha512sums=('35a8b3937cfb6d7684fdddaa2f88872c9e787dd6acbb88f404d4751c1cd59ef24bb1bd916457162984f084e1cdb7da530dabe22e26968b6f96cd5037914fe5c7')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname
}

#vim: syntax=sh
