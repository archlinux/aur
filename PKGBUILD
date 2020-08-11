# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

pkgname=operator-sdk
pkgver=1.0.0
pkgrel=1
pkgdesc="SDK for building Kubernetes applications. Provides high level APIs, useful abstractions, and project scaffolding."
url="https://github.com/operator-framework/operator-sdk"
license=('Apache')
arch=('x86_64')
depends=()
conflicts=('operator-sdk-git')
source=("https://github.com/operator-framework/operator-sdk/releases/download/v${pkgver}/operator-sdk-v${pkgver}-${CARCH}-linux-gnu")
sha256sums=('4fe18ef89e0b3d6e5ae7d0e2411cc3102b2527e071227542e13b90f4fd86b161')

package() {
  install -Dm755 "${srcdir}/operator-sdk-v${pkgver}-${CARCH}-linux-gnu" "${pkgdir}/usr/bin/operator-sdk"
}
