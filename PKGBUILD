# Maintainer: James McMurray <jamesmcm03@gmail.com>

_pkgname="vopono"
pkgname=vopono-bin
pkgver=0.8.8
pkgrel=1
pkgdesc='Run applications through VPN connections in network namespaces'
arch=('x86_64' 'armv7h')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
optdepends=('openvpn: for OpenVPN connections' 'wireguard-tools: for Wireguard connections' 'shadowsocks-libev: for Shadowsocks support (Mullvad)' 'openfortivpn: for FortiClient VPN connections')
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_x86-64_gcc")
source_armv7h=("${_pkgname}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_armv7")
noextract=("${_pkgname}")
sha256sums_x86_64=('e1ae7d7e93c9c404746ce06ddab47da513aefb3f8f35e7577974087f36ebe0b7')
sha256sums_armv7h=('0f143d7a2ff4d0134dfae0448888f8df2332f4c581b9d1732ace1773a61e44b2')
provides=('vopono')
conflicts=('vopono')

package() {
  install -Dm755 ${_pkgname}-${pkgver} "${pkgdir}/usr/bin/${_pkgname}"
}
