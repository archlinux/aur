# Maintainer: Matt M <numbernine dot archlinux at complexnumber dot net>

pkgname=kyverno-cli-bin
_pkgname=kyverno-cli
pkgver=1.17.2
pkgrel=1
pkgdesc="Kubernetes Native Policy Management - CLI"
arch=('x86_64')
url="https://github.com/kyverno/kyverno"
license=("Apache-2.0")
conflicts=(kyverno-git)
provides=(kyverno-git)
source=("${_pkgname}_v${pkgver}_linux_x86_64.tar.gz::https://github.com/kyverno/kyverno/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_x86_64.tar.gz")

sha256sums=('c8de49d2865b419a3f74f6755a11b381ebab23f96afab9bf6657ac2e832f2e0b')

package() {
  install -Dm755 "$srcdir/kyverno" "$pkgdir/usr/bin/kyverno"
}
