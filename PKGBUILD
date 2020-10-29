# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=kube-linter
pkgver=0.1.1
pkgrel=1
pkgdesc="KubeLinter is a static analysis tool that checks Kubernetes YAML files and Helm charts to ensure the applications represented in them adhere to best practices."
url="https://github.com/stackrox/$pkgname"
license=('APACHE')
source=("$url/releases/download/$pkgver/$pkgname-linux.tar.gz")
arch=('x86_64')
sha512sums=('0192ce56bffb21e04d1fe8a285650378c72d689e029d9407fb923ad34d613e7f8c73440570f37c8a219a9cff226e97e3b9241b09c673cd23af433cf4eedd6109')

package() {
  install -D -m 0755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
}

#vim: syntax=sh
