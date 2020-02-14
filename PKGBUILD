# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

pkgname=operator-sdk
pkgver=0.15.2
pkgrel=1
pkgdesc="SDK for building Kubernetes applications. Provides high level APIs, useful abstractions, and project scaffolding."
url="https://github.com/operator-framework/operator-sdk"
license=('Apache')
arch=('x86_64')
depends=()
conflicts=('operator-sdk-git')
source=("https://github.com/operator-framework/operator-sdk/releases/download/v${pkgver}/operator-sdk-v${pkgver}-${CARCH}-linux-gnu")
sha256sums=('bafc24e6dfb4b838fbf32fb57ff81b24d5b2af2fb2e6478b06c655d69113a993')

package() {
  install -Dm755 "${srcdir}/operator-sdk-v${pkgver}-${CARCH}-linux-gnu" "${pkgdir}/usr/bin/operator-sdk"
}
