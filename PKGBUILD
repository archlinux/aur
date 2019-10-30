# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

pkgname=operator-sdk
pkgver=0.12.0
pkgrel=1
pkgdesc="SDK for building Kubernetes applications. Provides high level APIs, useful abstractions, and project scaffolding."
url="https://github.com/operator-framework/operator-sdk"
license=('Apache')
arch=('x86_64')
depends=()
conflicts=('operator-sdk-git')
source=("https://github.com/operator-framework/operator-sdk/releases/download/v${pkgver}/operator-sdk-v${pkgver}-${CARCH}-linux-gnu")
sha256sums=('3c307bf4d9b0ec520d36864128b6e6a315c79e46ab6ec36eba9492d402f6e491')

package() {
  install -Dm755 "${srcdir}/operator-sdk-v${pkgver}-${CARCH}-linux-gnu" "${pkgdir}/usr/bin/operator-sdk"
}
