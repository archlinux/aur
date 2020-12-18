# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kube-linter
pkgname=$_pkgname-bin
pkgver=0.1.5
pkgrel=0
pkgdesc="KubeLinter is a static analysis tool that checks Kubernetes YAML files and Helm charts to ensure the applications represented in them adhere to best practices."
url="https://github.com/stackrox/$_pkgname"
license=('APACHE')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname-linux.tar.gz")
arch=('x86_64')
sha512sums=('3ec5a47d71d2bf7ce2f52bbe98b4fe3b3c29d545f43c0ef21990f104e48cf3f9c579bcdf77f0bd92f39baabbbb211b9861e838c8a027553b2eff9a42bf3b8b00')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname
}

#vim: syntax=sh
