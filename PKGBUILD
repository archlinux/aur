# Maintainer: Marco Steiger <marco (at) steiger (dot) online>
pkgname=routeros-upgrader-bin
pkgver=0.2.1
pkgrel=1
pkgdesc='Mass-Upgrade Mikrotik RouterOS devices synchronized'
arch=('x86_64')
url="https://github.com/Marco98/routeros-upgrader"
source=(
  "https://github.com/Marco98/routeros-upgrader/releases/download/v${pkgver}/routeros-upgrader_${pkgver}_linux_amd64"
)
sha256sums=('b72a38f79a946976e023669566966a7c1ac74511c21edf55ac8b040742a4634d')

package() {
    install -Dm755 "${srcdir}/routeros-upgrader_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/routeros-upgrader"
}

