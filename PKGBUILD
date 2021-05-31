# Maintainer: James McMurray <jamesmcm03@gmail.com>

_pkgname="vopono"
pkgname=vopono-bin
pkgver=0.8.1
pkgrel=1
pkgdesc='Run applications through VPN connections in network namespaces'
arch=('x86_64')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
optdepends=('openvpn: for OpenVPN connections' 'wireguard-tools: for Wireguard connections' 'shadowsocks-libev: for Shadowsocks support (Mullvad)')
source_x86_64=("${_pkgname}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_x86-64_gcc")
source_armv7h=("${_pkgname}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_armv7")
noextract=("${_pkgname}")
sha256sums_x86_64=('13e421c47fa27acc4f5e9ceb73df598fc0bd29efbdcb44403c961681275693ce')
sha256sums_armv7h=('1a063aad4ca5ac39929dcc245cd71704e8e453c2eb589f9a4a6d19611e82988c')
provides=('vopono')
conflicts=('vopono')

package() {
  install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
