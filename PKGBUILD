# Maintainer: Marco Steiger <marco (at) steiger (dot) online>
pkgname=routeros-upgrader-bin
pkgver=0.3.1
pkgrel=1
pkgdesc='Mass-Upgrade Mikrotik RouterOS devices synchronized'
arch=('x86_64')
url="https://github.com/Marco98/routeros-upgrader"
source=(
  "https://github.com/Marco98/routeros-upgrader/releases/download/v${pkgver}/routeros-upgrader_${pkgver}_linux_amd64"
)
sha256sums=('94ea68168904332ce9d42cd49cec52247a05f43e905a8ac177d7fb576027448a')

package() {
    install -Dm755 "${srcdir}/routeros-upgrader_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/routeros-upgrader"
}

