# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kube-linter
pkgname=$_pkgname-bin
pkgver=0.1.3
pkgrel=3
pkgdesc="KubeLinter is a static analysis tool that checks Kubernetes YAML files and Helm charts to ensure the applications represented in them adhere to best practices."
url="https://github.com/stackrox/$_pkgname"
license=('APACHE')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname-linux.tar.gz")
arch=('x86_64')
sha512sums=('a714d71eef7c5b544afd9021593ddf1e82996f864a81bdf2a152958f45355ce366af25feaa2556b6e82cf616ed8c5ccb690f0f14498a89e6587eba0ba1c5345c')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname
}

#vim: syntax=sh
