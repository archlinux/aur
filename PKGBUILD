# Maintainer: Matt M <numbernine dot archlinux at complexnumber dot net>

pkgname=kyverno-cli-bin
_pkgname=kyverno-cli
pkgver=1.19.1
pkgrel=1
pkgdesc="Kubernetes Native Policy Management - CLI"
arch=('x86_64')
url="https://github.com/kyverno/kyverno"
license=("Apache-2.0")
conflicts=(kyverno-git)
provides=(kyverno-git)
source=("${_pkgname}_v${pkgver}_linux_x86_64.tar.gz::https://github.com/kyverno/kyverno/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_x86_64.tar.gz")

sha256sums=('b38228f367fc0fdc2b08f4c83ea50ac5f16c60ff8d62d76a66157c33c47b70ae')

package() {
  install -Dm755 "$srcdir/kyverno" "$pkgdir/usr/bin/kyverno"
}
