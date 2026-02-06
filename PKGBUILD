# Maintainer: Matt M <numbernine dot archlinux at complexnumber dot net>

pkgname=kyverno-cli-bin
_pkgname=kyverno-cli
pkgver=1.17.0
pkgrel=1
pkgdesc="Kubernetes Native Policy Management - CLI"
arch=('x86_64')
url="https://github.com/kyverno/kyverno"
license=("Apache-2.0")
conflicts=(kyverno-git)
provides=(kyverno-git)
source=("${_pkgname}_v${pkgver}_linux_x86_64.tar.gz::https://github.com/kyverno/kyverno/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_x86_64.tar.gz")

sha256sums=('f3ed671574fcca224e30c259131e524b0594f84f864c7c5087cdcfdae6d605e2')

package() {
  install -Dm755 "$srcdir/kyverno" "$pkgdir/usr/bin/kyverno"
}
