# Maintainer: Marco Steiger <marco (at) steiger (dot) online>
pkgname=routeros-upgrader-bin
pkgver=0.3.0
pkgrel=2
pkgdesc='Mass-Upgrade Mikrotik RouterOS devices synchronized'
arch=('x86_64')
url="https://github.com/Marco98/routeros-upgrader"
source=(
  "https://github.com/Marco98/routeros-upgrader/releases/download/v${pkgver}/routeros-upgrader_${pkgver}_linux_amd64"
)
sha256sums=('42b7307cf3e1752174d3c9d76024923ae34363345e54741a91f3585ad4b7b81d')

package() {
    install -Dm755 "${srcdir}/routeros-upgrader_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/routeros-upgrader"
}

