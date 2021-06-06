# Maintainer: James McMurray <jamesmcm03@gmail.com>

_pkgname="vopono"
pkgname=vopono-bin
pkgver=0.8.2
pkgrel=1
pkgdesc='Run applications through VPN connections in network namespaces'
arch=('x86_64')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
optdepends=('openvpn: for OpenVPN connections' 'wireguard-tools: for Wireguard connections' 'shadowsocks-libev: for Shadowsocks support (Mullvad)')
source_x86_64=("${_pkgname}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_x86-64_gcc")
source_armv7h=("${_pkgname}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_armv7")
noextract=("${_pkgname}")
sha256sums_x86_64=('33dc536d3b9f24310f5b40bb3dc4336323e555d2a2a19131c764e2f8e9450625')
sha256sums_armv7h=('6f3e8b41a4b1d0ad327aae1ba21921160a475e08d3985810d5c919095ef64e0a')
provides=('vopono')
conflicts=('vopono')

package() {
  install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
