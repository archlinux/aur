# Maintainer: Marco Steiger <marco (at) steiger (dot) online>
pkgname=routeros-upgrader-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Mass-Upgrade Mikrotik RouterOS devices synchronized'
arch=('x86_64')
url="https://github.com/Marco98/routeros-upgrader"
source=(
  "routeros-upgrader::https://github.com/Marco98/routeros-upgrader/releases/download/v${pkgver}/routeros-upgrader_${pkgver}_linux_amd64"
)
sha256sums=('429e0620779686bfdd4ee8b52b87d30ba570169fc3f9062cd758be193b12d746')

package() {
    install -Dm755 "${srcdir}/routeros-upgrader" "${pkgdir}/usr/bin/routeros-upgrader"
}

