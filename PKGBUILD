# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

pkgname=operator-sdk
pkgver=0.7.0
pkgrel=2
pkgdesc="SDK for building Kubernetes applications. Provides high level APIs, useful abstractions, and project scaffolding."
url="https://github.com/operator-framework/operator-sdk"
license=('Apache')
arch=('x86_64')
depends=()
conflicts=('operator-sdk-git')
source=("https://github.com/operator-framework/operator-sdk/releases/download/v${pkgver}/operator-sdk-v${pkgver}-${CARCH}-linux-gnu")
sha256sums=('3e9056e63e00c8616a4a4d9ed7e1fa0f0b552a4c8673771f397bc76f4756c66b')

package() {
  install -Dm755 "${srcdir}/operator-sdk-v${pkgver}-${CARCH}-linux-gnu" "${pkgdir}/usr/bin/operator-sdk"
}
