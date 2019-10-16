# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

pkgname=operator-sdk
pkgver=0.11.0
pkgrel=1
pkgdesc="SDK for building Kubernetes applications. Provides high level APIs, useful abstractions, and project scaffolding."
url="https://github.com/operator-framework/operator-sdk"
license=('Apache')
arch=('x86_64')
depends=()
conflicts=('operator-sdk-git')
source=("https://github.com/operator-framework/operator-sdk/releases/download/v${pkgver}/operator-sdk-v${pkgver}-${CARCH}-linux-gnu")
sha256sums=('7616026ea6859ad07fc413ed6c79fe0fe82aa7de37cb38c0ea6645cf1b4a9bd1')

package() {
  install -Dm755 "${srcdir}/operator-sdk-v${pkgver}-${CARCH}-linux-gnu" "${pkgdir}/usr/bin/operator-sdk"
}
