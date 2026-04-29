# Maintainer: Matt M <numbernine dot archlinux at complexnumber dot net>

pkgname=kyverno-cli-bin
_pkgname=kyverno-cli
pkgver=1.18.0
pkgrel=1
pkgdesc="Kubernetes Native Policy Management - CLI"
arch=('x86_64')
url="https://github.com/kyverno/kyverno"
license=("Apache-2.0")
conflicts=(kyverno-git)
provides=(kyverno-git)
source=("${_pkgname}_v${pkgver}_linux_x86_64.tar.gz::https://github.com/kyverno/kyverno/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_x86_64.tar.gz")

sha256sums=('3aa7b7aa68732fd6bc5732f1030d0ed12e1b0ffe7dbac5f5aa21fd8695718904')

package() {
  install -Dm755 "$srcdir/kyverno" "$pkgdir/usr/bin/kyverno"
}
