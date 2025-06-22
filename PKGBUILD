# Maintainer: James McMurray <jamesmcm03@gmail.com>

_pkgname="vopono"
pkgname=vopono-bin
pkgver=0.10.13
pkgrel=1
pkgdesc='Run applications through VPN connections in network namespaces'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
optdepends=('openvpn: for OpenVPN connections' 'wireguard-tools: for Wireguard connections' 'shadowsocks-libev: for Shadowsocks support (Mullvad)' 'openfortivpn: for FortiClient VPN connections' 'libnatpmp: for ProtonVPN port forwarding support' 'trojan: for Trojan Wireguard forwarding support')
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_x86-64_gcc")
source_armv7h=("${_pkgname}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_armv7")
source_aarch64=("${_pkgname}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_aarch64")
noextract=("${_pkgname}")
sha256sums_x86_64=('dc55b0ab38d391a0bec8a68d571e64742453fc356a1b1259df69166e9583cb52')
sha256sums_armv7h=('991d3ca79d50a18cfeb4d1ccfc5f6049bb2c9b8ad361cadb8e7e52cf090008b8')
sha256sums_aarch64=('83a6600139cab03d259ef527dbd33d3146c57de7fe4b87779210afeee1136558')
provides=('vopono')
conflicts=('vopono')

package() {
  install -Dm755 ${_pkgname}-${pkgver} "${pkgdir}/usr/bin/${_pkgname}"
}
