# Maintainer: James McMurray <jamesmcm03@gmail.com>

_pkgname="vopono"
pkgname=vopono-bin
pkgver=0.8.5
pkgrel=1
pkgdesc='Run applications through VPN connections in network namespaces'
arch=('x86_64' 'armv7h')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
optdepends=('openvpn: for OpenVPN connections' 'wireguard-tools: for Wireguard connections' 'shadowsocks-libev: for Shadowsocks support (Mullvad)' 'openfortivpn: for FortiClient VPN connections')
source_x86_64=("${_pkgname}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_x86-64_gcc")
source_armv7h=("${_pkgname}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_armv7")
noextract=("${_pkgname}")
sha256sums_x86_64=('81b97e031396d093a7e4fb4ce534be581ef59c5700383619c981eb10fc783ae9')
sha256sums_armv7h=('5f68cf4fca8e764d74e74628d3dd02c6f86e8d6370103e81eef2fa09fd454880')
provides=('vopono')
conflicts=('vopono')

package() {
  install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
