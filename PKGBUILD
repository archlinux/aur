# Maintainer: Matt M <numbernine dot archlinux at complexnumber dot net>

pkgname=kyverno-cli-bin
_pkgname=kyverno-cli
pkgver=1.14.4
pkgrel=1
pkgdesc="Kubernetes Native Policy Management - CLI"
arch=('x86_64')
url="https://github.com/kyverno/kyverno"
license=("Apache-2.0")
conflicts=(kyverno-git)
provides=(kyverno-git)
source=("${_pkgname}_v${pkgver}_linux_x86_64.tar.gz::https://github.com/kyverno/kyverno/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_x86_64.tar.gz")

sha256sums=('1a76da4c21e39fa869e1363c661e19f1c0b7d71980b40c9e1b01a6196563012b')

package() {
  install -Dm755 "$srcdir/kyverno" "$pkgdir/usr/bin/kyverno"
}
