# Maintainer: Marco Steiger <marco (at) steiger (dot) online>
pkgname=routeros-upgrader-bin
pkgver=0.3.3
pkgrel=1
pkgdesc='Mass-Upgrade Mikrotik RouterOS devices synchronized'
arch=('x86_64')
url="https://github.com/Marco98/routeros-upgrader"
source=(
  "https://github.com/Marco98/routeros-upgrader/releases/download/v${pkgver}/routeros-upgrader_${pkgver}_linux_amd64"
)
sha256sums=('32f9c08e185344913a6b978ba9b2fa36f01d26a3b06403627183c60288dc5c25')

package() {
    install -Dm755 "${srcdir}/routeros-upgrader_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/routeros-upgrader"
}

