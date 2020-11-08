# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kube-linter
pkgname=$_pkgname-bin
pkgver=0.1.2
pkgrel=2
pkgdesc="KubeLinter is a static analysis tool that checks Kubernetes YAML files and Helm charts to ensure the applications represented in them adhere to best practices."
url="https://github.com/stackrox/$_pkgname"
license=('APACHE')
source=("$url/releases/download/$pkgver/$_pkgname-linux.tar.gz")
arch=('x86_64')
sha512sums=('274e8a2b7f70d8fa80a547f832f3c22054b93f8750a7675031e6be28f610dcf722a1ce42f1be2ecb4eb324be3166560100a4541a253b6a874e3da54135eaace9')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname
}

#vim: syntax=sh
