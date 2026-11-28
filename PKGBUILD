# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kubernikus-bin
pkgver=1.0.0+ee124b37dc7435f2cd47e8795a776c45a9e3488f
pkgrel=1
pkgdesc="CLI for Kubernikus, Kubernetes as a service for OpenStack"
arch=('x86_64')
url="https://github.com/sapcc/kubernikus"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/kubernikusctl_linux_amd64")
sha256sums_x86_64=('c7d2920b8a48c145da35d90a61c7565f81310d606b3de8d1c6cc5df4a51e26a1')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/kubernikusctl"
}
