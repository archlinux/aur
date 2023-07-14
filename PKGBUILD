# Maintainer: Marco Steiger <marco (at) steiger (dot) online>
pkgname=routeros-upgrader-bin
pkgver=0.2.1
pkgrel=2
pkgdesc='Mass-Upgrade Mikrotik RouterOS devices synchronized'
arch=('x86_64')
url="https://github.com/Marco98/routeros-upgrader"
source=(
  "https://github.com/Marco98/routeros-upgrader/releases/download/v${pkgver}/routeros-upgrader_${pkgver}_linux_amd64"
)
sha256sums=('145cf2e1a963e4acadc91dc1e5158f55dc44b2a79dd8bb61666dc88cbff55d4a')

package() {
    install -Dm755 "${srcdir}/routeros-upgrader_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/routeros-upgrader"
}

