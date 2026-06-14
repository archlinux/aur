# Maintainer: James McMurray <jamesmcm03@gmail.com>

_pkgname="vopono"
pkgname=vopono-bin
pkgver=0.10.18
pkgrel=1
pkgdesc='Run applications through VPN connections in network namespaces'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
optdepends=('openvpn: for OpenVPN connections' 'wireguard-tools: for Wireguard connections' 'shadowsocks-libev: for Shadowsocks support (Mullvad)' 'openfortivpn: for FortiClient VPN connections' 'libnatpmp: for ProtonVPN port forwarding support' 'trojan: for Trojan Wireguard forwarding support')
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_x86-64_gcc")
source_armv7h=("${_pkgname}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_armv7")
source_aarch64=("${_pkgname}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_aarch64")
noextract=("${_pkgname}-${pkgver}")
sha256sums_x86_64=('92ec60326504c77e0d6864b37ab865a8491afa8f825eb04367942227806570ba')
sha256sums_armv7h=('b1ec1be0819201da1bb3c5293b08df50d1689ff520295a3ab0b79b9b033996df')
sha256sums_aarch64=('50be257f05f2abedfd64ec28d17ef7e5174b388ede437d78e66cd899e6ac5c2a')
provides=('vopono')
conflicts=('vopono')

package() {
  install -Dm755 ${_pkgname}-${pkgver} "${pkgdir}/usr/bin/${_pkgname}"
}
